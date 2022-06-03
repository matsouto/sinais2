clear
% Carrega o audio
[yg,fsg] = audioread('vrg.m4a');

% Informações dos arquivos
infog = audioinfo('vrg.m4a');
taxaAmostragemg = extractfield(infog,'SampleRate');
totalAmostrasg = extractfield(infog,'TotalSamples');
duracaog = extractfield(infog,'Duration');

% Print de informações do audio
disp(['Taxa de Amostragem: ', num2str(taxaAmostragemg)]);
disp(['Total de Amostras: ', num2str(totalAmostrasg)]);
disp(['Duração: ', num2str(duracaog)]);

% Gráfico no domínio do tempo
time = (0:1:duracaog);

figure(1), clf;
subplot(2,1,1);
plot(time,yg);




