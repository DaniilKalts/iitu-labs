// Laboratory work 7 - Simple Control System Design with XCOS
// Builds the Xcos diagrams for the lab:
//   open_loop.zcos          - Figure 3: step -> DC-motor (1/(10+10s)) -> scope
//   closed_loop.zcos        - Figure 4: PID with gains P=1, I=1, D=1 (Figure 5)
//   closed_loop_tuned.zcos  - Figure 4 with manually tuned gains ("ideal step response")
//
// Run:  scilab-cli -nb -f build_diagrams.sce
// Then open any .zcos in Xcos and press Start.

loadXcosLibs(); loadScicos();
here = get_absolute_file_path("build_diagrams.sce");

// Use block "set" functions without dialogs: they read graphics.exprs.
prot = funcprot(); funcprot(0);
scicos_getvalue = setvalue; getvalue = setvalue;
function message(txt), mprintf("%s\n", strcat(txt, " ")), endfunction
funcprot(prot);
%scicos_prob = %f; %scicos_context = struct(); needcompile = 4;

// Layout helpers. Coordinates are in pixels, y grows upwards.
function blk = place(blk, x, y, w, h)
    blk.graphics.orig = [x y];
    blk.graphics.sz = [w h];
endfunction

// regular (data) link; xx/yy = polyline from source port to target port
function lnk = wire(from, to, xx, yy)
    lnk = scicos_link(from=from, to=to, ct=[1 1], xx=xx(:), yy=yy(:));
endfunction

function lnk = evwire(from, to, xx, yy)  // activation (clock) link
    lnk = scicos_link(from=from, to=to, ct=[5 -1], xx=xx(:), yy=yy(:));
endfunction

// STEP_FUNCTION: step from 0 to 1 at t = 0 (as in the expected graph)
function blk = make_step()
    blk = STEP_FUNCTION("define");
    inner = blk.model.rpar;
    for k = 1:length(inner.objs)
        o = inner.objs(k);
        if typeof(o) == "Block" & o.gui == "STEP" then
            o.graphics.exprs = ["0"; "0"; "1"];  // step time, initial, final
            o = STEP("set", o);
            inner.objs(k) = o;
        end
    end
    blk.model.rpar = inner;
endfunction

// DC-motor: CLR block with 1 / (10 + 10*s)
function blk = make_motor()
    blk = CLR("define");
    blk.graphics.exprs = ["1"; "10+10*s"];
    blk = CLR("set", blk);
    // label exactly like Figure 1 (the default label turns "*" into ",")
    blk.graphics.style = "CLR;displayedLabel=$\small\mathsf{\frac{1}{10+10*s}}$";
endfunction

function blk = make_clock()
    blk = CLOCK_c("define");                     // period 0.01 s, start at 0
    inner = blk.model.rpar;
    for k = 1:length(inner.objs)
        o = inner.objs(k);
        if typeof(o) == "Block" & o.gui == "EVTDLY_c" then
            o.graphics.exprs = ["0.01"; "0"];
            o.model.rpar = [0.01; 0];
            o.model.firing = 0;
            inner.objs(k) = o;
        end
    end
    blk.model.rpar = inner;
endfunction

// CMSCOPE with 2 graphs: 1 = motor output (RPM), 2 = input voltage
function blk = make_scope(tf, ymax1)
    blk = CMSCOPE("define");
    blk.graphics.exprs = ["1 1"; "1 3"; "-1"; "[]"; "[]"; ..
                          "0 0"; string(ymax1) + " 1.2"; ..
                          string(tf) + " " + string(tf); "20000"; "0"; ..
                          "Output (RPM);Input (Voltage)"];
    blk = CMSCOPE("set", blk);
    blk.graphics.style = "CMSCOPE";   // no text under the scope (as in Figures 3-4)
endfunction

function blk = make_pid(p, i, d)
    blk = set_pid_gains(PID("define"), [p i d]);
endfunction

// Change the gains of an existing PID block; g = [Kp Ki Kd] (used by simulate.sce).
// The PID block is a superblock: its gains live in three inner GAINBLK blocks,
// identified (like PID.sci does) by what each gain is wired to.
function blk = set_pid_gains(blk, g)
    inner = blk.model.rpar;
    for k = 1:length(inner.objs)
        o = inner.objs(k);
        if typeof(o) <> "Link" then continue; end
        a = inner.objs(o.from(1)); b = inner.objs(o.to(1));
        gidx = 0; other = "";
        if a.gui == "GAINBLK" then gidx = o.from(1); other = b.gui;
        elseif b.gui == "GAINBLK" then gidx = o.to(1); other = a.gui; end
        if gidx == 0 then continue; end
        select other
        case "SUMMATION" then v = g(1);
        case "INTEGRAL_m" then v = g(2);
        case "DERIV" then v = g(3);
        else continue;
        end
        gb = inner.objs(gidx);
        gb.graphics.exprs = string(v);
        gb.model.rpar = v;
        inner.objs(gidx) = gb;
    end
    blk.model.rpar = inner;
endfunction

function blk = make_gain(g)
    blk = GAINBLK_f("define");
    blk.graphics.exprs = string(g);
    blk = GAINBLK_f("set", blk);
endfunction

function scs = new_diagram(name, tf)
    scs = scicos_diagram();
    scs.props.title = name;
    scs.props.tf = tf;
endfunction

// ---------- Open loop (Figure 3) ----------
// Xcos coordinates: x to the right, y DOWN. Main signal line at y = 30.
// Scope inputs: 1 (upper, y=20) = motor output, 2 (lower, y=40) = input voltage.
function scs = open_loop(tf)
    scs = new_diagram("open_loop", tf);
    scs.objs(1) = place(make_step(),          40,  10, 40, 40);
    scs.objs(2) = place(SPLIT_f("define"),   116.5, 26.5, 7, 7);
    scs.objs(3) = place(make_motor(),        240,   0, 80, 60);
    scs.objs(4) = place(make_scope(tf, 0.12), 460, 10, 40, 40);
    scs.objs(5) = place(make_clock(),        460, -90, 40, 40);
    scs.objs(6) = wire([1 1 0], [2 1 1], [80 120], [30 30]);              // step  -> split
    scs.objs(7) = wire([2 1 0], [3 1 1], [120 240], [30 30]);             // split -> motor
    scs.objs(8) = wire([2 2 0], [4 2 1], [120 120 420 420 460], ..
                                         [30 120 120 40 40]);             // split -> scope in 2 (voltage)
    scs.objs(9) = wire([3 1 0], [4 1 1], [320 380 380 460], [30 30 20 20]); // motor -> scope in 1 (RPM)
    scs.objs(10) = evwire([5 1 0], [4 1 1], [480 480], [-50 10]);         // clock -> scope
endfunction

// ---------- Closed loop (Figure 4) ----------
// SUM_f inputs: 1 = top (left unused, as in Figure 4), 2 = left, 3 = bottom.
function scs = closed_loop(tf, p, i, d)
    scs = new_diagram("closed_loop", tf);
    scs.objs(1) = place(make_step(),          40,  10, 40, 40);
    scs.objs(2) = place(SPLIT_f("define"),   106.5, 26.5, 7, 7);
    scs.objs(3) = place(SUM_f("define"),     160,  20, 20, 20);
    scs.objs(4) = place(make_pid(p, i, d),   220,  10, 40, 40);
    scs.objs(5) = place(make_motor(),        300,   0, 80, 60);
    scs.objs(6) = place(SPLIT_f("define"),   436.5, 26.5, 7, 7);
    g = place(make_gain(-1),                 320,  90, 40, 40);   // negative feedback
    g.graphics.style = "GAINBLK_f;rotation=180;flip=false;mirror=false"; // points left
    scs.objs(7) = g;
    scs.objs(8) = place(make_scope(tf, 1.2), 540,  10, 40, 40);
    scs.objs(9) = place(make_clock(),        540, -90, 40, 40);
    scs.objs(10) = wire([1 1 0], [2 1 1], [80 110], [30 30]);             // step  -> split
    scs.objs(11) = wire([2 1 0], [3 2 1], [110 160], [30 30]);            // split -> sum, left (+)
    scs.objs(12) = wire([2 2 0], [8 2 1], [110 110 500 500 540], ..
                                          [30 170 170 40 40]);            // split -> scope in 2 (voltage)
    scs.objs(13) = wire([3 1 0], [4 1 1], [180 220], [30 30]);            // sum   -> PID (error)
    scs.objs(14) = wire([4 1 0], [5 1 1], [260 300], [30 30]);            // PID   -> motor
    scs.objs(15) = wire([5 1 0], [6 1 1], [380 440], [30 30]);            // motor -> split
    scs.objs(16) = wire([6 1 0], [8 1 1], [440 480 480 540], [30 30 20 20]); // split -> scope in 1 (RPM)
    scs.objs(17) = wire([6 2 0], [7 1 1], [440 440 360], [30 110 110]);   // split -> gain -1
    scs.objs(18) = wire([7 1 0], [3 3 1], [320 170 170], [110 110 40]);   // gain  -> sum, bottom
    scs.objs(19) = evwire([9 1 0], [8 1 1], [560 560], [-50 10]);         // clock -> scope
endfunction

tf = 10;
xcosDiagramToScilab(here + "open_loop.zcos", open_loop(tf));
xcosDiagramToScilab(here + "closed_loop.zcos", closed_loop(tf, 1, 1, 1));
// Tuned manually: Ki = Kp cancels the motor pole (s = -1), so the loop
// becomes a fast first-order system with time constant 10/Kp = 0.5 s:
// no overshoot, zero steady-state error, settles in about 2 s.
xcosDiagramToScilab(here + "closed_loop_tuned.zcos", closed_loop(tf, 20, 20, 0));
mprintf("Diagrams saved to %s\n", here);
