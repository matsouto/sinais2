clear
% Carrega o audio
[yg,fsg] = audioread('vrg.m4a');

% Informa��es dos arquivos
infog = audioinfo('vrg.m4a');
taxaAmostragemg = extractfield(infog,'SampleRate');
totalAmostrasg = extractfield(infog,'TotalSamples');
duracaog = extractfield(infog,'Duration');

% Print de informa��es do audio
disp(['Taxa de Amostragem: ', num2str(taxaAmostragemg)]);
disp(['Total de Amostras: ', num2str(totalAmostrasg)]);
disp(['Dura��o: ', num2str(duracaog)]);

% Gr�fico no dom�nio do tempo
time = linspace(0,duracaog,totalAmostrasg);

figure(1), clf;
subplot(2,1,1);
plot(time,yg);
title('Dom�nio do Tempo')
xlabel('Tempo (s)')
set(gca,'xlim',time([1 end]))




