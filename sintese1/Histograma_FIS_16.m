counts = [5, 4, 5, 1, 4, 2, 1, 3, 6, 4, 5, 2, 5, 3, 10, 8, 2, 3, 3, 4, 3, 8, 3, 4, 5, 5, 3, 3, 4, 5, 2, 4, 2, 5, 4, 6, 3, 2, 1, 3, 3, 0, 5, 4, 7, 4, 4, 2, 6, 5, 5, 4, 6, 2, 3, 3, 6, 4, 3, 4, 3, 4, 1, 7, 3, 3, 5, 7, 2, 7, 3, 5, 6, 3, 6, 3, 3, 1, 5, 7, 2, 4, 3, 6, 4, 4, 4, 4, 2, 4, 4, 3, 3, 4, 1, 5, 3, 2, 3, 2];

x = 0:24;
exp_counts = 100 * ((1/6).^x) .* ((5/6).^(24-x)) * factorial(24)./(factorial(x) .* factorial(24 - x));

hold on
title("Histograma de contagens", "FontSize", 26)
xlabel('n',FontSize=21,FontWeight="bold")
ylabel("Contagens", FontSize=21, FontWeight="bold")
plot(x, exp_counts, "Marker",".", "MarkerSize", 20, "Color","k", "LineStyle","none")
histogram(counts, 25, "BinEdges", -0.5:1:23.5)
ax = gca;
ax.FontSize = 15;
legend("Contagens esperadas", "Contagens experimentais", FontSize=18)