// Laboratory work 7 - comparison plots built from the scope data that
// simulate.sce exported (images/data_*.csv). Run after simulate.sce.
here = get_absolute_file_path("plots.sce");
img = here + "images/";

function compare(names, labels, ttl, png, ymax)
    f = scf(); f.figure_size = [900 520]; f.background = 8;
    colors = [2 5 3 13 6];   // blue, red, green, dark green, magenta
    for k = 1:size(names, "*")
        d = csvRead(img + "data_" + names(k) + ".csv");
        plot2d(d(:,1), d(:,2), style = colors(k));
        e = gce(); e.children(1).thickness = 2;
    end
    d = csvRead(img + "data_" + names(1) + ".csv");
    plot2d(d(:,1), d(:,3), style = 1); e = gce(); e.children(1).line_style = 2;
    a = gca(); a.data_bounds = [0 -0.05; 10 ymax]; a.grid = [12 12];
    a.font_size = 2; a.title.text = ttl; a.title.font_size = 3;
    a.x_label.text = "Time t, s"; a.y_label.text = "Motor speed (normalised RPM)";
    a.x_label.font_size = 2; a.y_label.font_size = 2;
    legend([labels, "Input step (voltage)"], "in_lower_right");
    xs2png(f, img + png);
    delete(f);
endfunction

compare(["open_loop" "closed_1_1_1" "final"], ..
    ["Open loop" "Closed loop, Kp=1 Ki=1 Kd=1" "Closed loop, tuned Kp=20 Ki=20 Kd=0"], ..
    "Open-loop vs closed-loop step response", "compare_open_closed.png", 1.15);
compare(["p_1" "p_5" "p_20" "p_50"], ..
    ["Kp=1" "Kp=5" "Kp=20" "Kp=50"], ..
    "Effect of the proportional gain Kp (Ki = 0, Kd = 0)", "compare_p.png", 1.15);
compare(["i_0" "i_5" "i_20" "i_80"], ..
    ["Ki=0" "Ki=5" "Ki=20" "Ki=80"], ..
    "Effect of the integral gain Ki (Kp = 20, Kd = 0)", "compare_i.png", 1.3);
compare(["d_0" "d_1" "d_2"], ..
    ["Kd=0" "Kd=1" "Kd=2"], ..
    "Effect of the derivative gain Kd (Kp = 20, Ki = 20)", "compare_d.png", 1.15);
mprintf("plots done\n");
