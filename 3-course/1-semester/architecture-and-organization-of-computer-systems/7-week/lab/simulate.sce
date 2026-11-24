// Laboratory work 7 - runs the Xcos diagrams and exports the results.
// Run: scilab -nw -nb -f simulate.sce   (needs a display for the scopes)
// Output: images/*.png and results.csv (step-response metrics)

here = get_absolute_file_path("simulate.sce");
exec(here + "build_diagrams.sce", -1);   // helpers + fresh .zcos files
img = here + "images/";
mkdir(img);

// Run a diagram, save its CMSCOPE window, return t and y (output) / u (input)
function [t, y, u] = run_scope(scs, png)
    old = winsid();
    Info = scicos_simulate(scs, list());
    w = setdiff(winsid(), old);
    f = scf(w($));
    f.figure_size = [900 650];
    f.background = 8;
    xs2png(f, png);
    // CMSCOPE: axes(2) = first input (output RPM), axes(1) = second (voltage)
    ax = f.children;
    py = ax(2).children(1).data;
    pu = ax(1).children(1).data;
    t = py(:,1); y = py(:,2); u = pu(:,2);
    delete(f);
endfunction

// Step-response metrics for a unit step applied at t = 0
function m = metrics(t, y)
    yf = y($);
    i10 = find(y >= 0.1 * yf, 1); i90 = find(y >= 0.9 * yf, 1);
    tr = %nan; if i10 <> [] & i90 <> [] then tr = t(i90) - t(i10); end
    os = max(0, (max(y) - yf) / abs(yf) * 100);
    outside = find(abs(y - yf) > 0.02 * abs(yf));
    ts = 0; if outside <> [] then ts = t(min(outside($) + 1, size(t, "*"))); end
    m = [yf, tr, os, ts, abs(1 - yf)];
endfunction

function scs = closed_with(g)
    importXcosDiagram(here + "closed_loop.zcos");
    scs = scs_m;
    for i = 1:length(scs.objs)
        o = scs.objs(i);
        if typeof(o) == "Block" then
            if o.gui == "PID" then scs.objs(i) = set_pid_gains(o, g); end
        end
    end
endfunction

// name, [Kp Ki Kd]
cases = list( ..
    list("closed_1_1_1",  [1 1 1]), ..
    list("p_1",   [1 0 0]),  list("p_5",   [5 0 0]),  list("p_20",  [20 0 0]), list("p_50", [50 0 0]), ..
    list("i_0",   [20 0 0]), list("i_5",   [20 5 0]), list("i_20",  [20 20 0]), list("i_80", [20 80 0]), ..
    list("d_0",   [20 20 0]), list("d_1",  [20 20 1]), list("d_2", [20 20 2]), list("d_3", [20 20 3]), ..
    list("final", [20 20 0]));

fd = mopen(here + "results.csv", "w");
mfprintf(fd, "case,Kp,Ki,Kd,final_value,rise_time,overshoot_pct,settling_time,ss_error\n");

importXcosDiagram(here + "open_loop.zcos");
[t, y, u] = run_scope(scs_m, img + "scope_open_loop.png");
m = metrics(t, y);
mfprintf(fd, "open_loop,,,,%.4f,%.3f,%.2f,%.3f,%.4f\n", m);
csvWrite([t y u], here + "images/data_open_loop.csv");

for k = 1:length(cases)
    c = cases(k); name = c(1); g = c(2);
    [t, y, u] = run_scope(closed_with(g), img + "scope_" + name + ".png");
    m = metrics(t, y);
    mfprintf(fd, "%s,%g,%g,%g,%.4f,%.3f,%.2f,%.3f,%.4f\n", name, g, m);
    csvWrite([t y u], img + "data_" + name + ".csv");
    mprintf("%-14s Kp=%-3g Ki=%-3g Kd=%-3g  yf=%.3f tr=%.2f OS=%.1f%% ts=%.2f\n", name, g, m(1:4));
end
mclose(fd);
mprintf("done\n");
