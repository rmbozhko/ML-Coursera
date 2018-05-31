t = 0.0:0.01:0.98; % x1:x2:x3 - generate sequence from x1 to x3 with step of x2
y1 = sin(2 * pi * 4 * t);
y2 = cos(2 * pi * 4 * t);

plot(t, y1);
hold on
plot(t, y2);
xlabel("time")
ylabel("value")
legend("sin", "cos")
title("My Plot")
print -dpng "myPlot.png" % saves plot as a png image in curr directory
close % close the currently opened plots
% allows to specify the number of plots working simultaneously
figure(1);
plot(t, y1);
% second window with new plot is openned
figure(2);
plot(t, y2);

subplot(1,2, 1); % first 2 params shows how subplot will be depicted, in this case, on half of the screen
plot(t, y1);
subplot(1,2, 2); % same as above, but with access to second element
plot(t, y2);
axis([0.5, 1, -1, 1]) % changes the range of x-axis and y-axis
clf; % clear the figures
magic_matrix = magic(15)
%heat map, explanation to heat map, grey heat map
% also example of commands comma chaining
imagesc(magic_matrix), colorbar, colormap grey % three different commands, one-by-one
