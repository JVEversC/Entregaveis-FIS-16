clear;
clc;
close all;

arquivos = {'dados_cb.txt', 'dados_cm.txt'};

N = 20;

for k = 1:length(arquivos)
    data = readmatrix(arquivos{k}, 'NumHeaderLines', 1);
    n = length(data);

    mediaTotal = mean(data);
    desvioTotal = std(data);
    numGrupos = floor(n / N);

    fprintf('\n');
    fprintf('========================================\n');
    fprintf('Arquivo: %s\n', arquivos{k});
    fprintf('========================================\n');

    fprintf('Número de dados: %d\n', n);
    fprintf('Média total: %.6f\n', mediaTotal);
    fprintf('Desvio padrão total: %.6f\n', desvioTotal);

    fprintf('\n');
    fprintf('Grupo\tMédia\t\tDesvio padrão\n');
    fprintf('----------------------------------------\n');

    for i = 1:numGrupos

        inicio = (i - 1) * N + 1;
        fim = i * N;

        grupo = data(inicio:fim);

        mediaGrupo = mean(grupo);
        desvioGrupo = std(grupo);

        fprintf('%d\t%.6f\t%.6f\n', ...
            i, mediaGrupo, desvioGrupo);

    end

end