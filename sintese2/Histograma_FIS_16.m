clear;
clc;
close all;

arquivos = {'dados_cb.txt', 'dados_cm.txt'};

graf_min = 11.3;
graf_max = 12.1;

for i = 1:length(arquivos)

    data = readmatrix(arquivos{k}, 'NumHeaderLines', 1);
    
    n_exp = mean(data);
    sigma_expec = std(data);

    f = figure;
    f.Color = 'w';
    f.Name = arquivos{i};

    n = length(data);
    k = ceil(1 + log2(n));

    h = histogram(data, k);
    hold on;

    x = linspace(graf_min, graf_max, 200);
    g = plot(x, normpdf(x, n_exp, sigma_expec) * ...
        length(data) * h.BinWidth, ...
        'r', 'LineWidth', 1.5);

    legend([h g], {'Dados experimentais', 'Distribuição Gaussiana'}, ...
        'FontSize', 13, 'Location', 'best');

    axis([graf_min graf_max 0 35]);

    ax = gca;
    ax.XAxis.FontSize = 14;
    ax.XMinorTick = 'on';
    ax.YMinorTick = 'on';
    ax.YAxis.FontSize = 14;

    tx = xlabel('\it{10T} (s)');
    ty = ylabel('Frequência');
    tx.FontSize = 16;
    ty.FontSize = 16;

end