clear
clc
hold on

% Carrega o audio
[yg,fsg] = audioread('vraf.m4a');

% Informações dos arquivos
info = audioinfo('vraf.m4a');
taxaAmostragem = fsg;
totalAmostras = extractfield(info,'TotalSamples');
duracao = extractfield(info,'Duration');

% Print de informações do audio
disp(['Taxa de Amostragem: ', num2str(taxaAmostragem)]);
disp(['Total de Amostras: ', num2str(totalAmostras)]);
disp(['Duração: ', num2str(duracao)]);

% Gráfico no domínio do tempo e da frequência
time = linspace(0,duracao,totalAmostras);
f = linspace(-pi,pi,totalAmostras);

%Filtro de Butterworth 
 fc = 2000; %frequencia de corte
 wn = fc/(fsg/2); %frequencia de corte normalizada
 [b,a] = butter(4,wn);
 yf = filter(b,a,yg);
 
%Transformadas
fourier_yg = fftshift(fft(yg));
fourier_yf = fftshift(fft(yf));

%Plotagem no domínio do tempo
figure(1), clf;
subplot(2,1,1);plot(time,yg); grid minor
title('Domínio do Tempo - Com Ruído')
xlabel('Tempo (s)');ylabel('Amplitude de X(KT)');
subplot(2,1,2);plot(time,yf); grid minor
title('Domínio do Tempo - Sem Ruído');
xlabel('Tempo(s)');ylabel('Amplitude de X(KT)')

%Plotagem no domínio da frequência
figure(2), clf;
subplot(2,1,1); plot(f,abs(fourier_yg)); grid minor
title('Domínio da Frequência - Sem Filtro')
xlabel('W (rad/s)'); ylabel('Amplitude de X(e^j^W)'); axis([-4 4 0 1200]);
subplot(2,1,2); plot(f,abs(fourier_yf)); grid minor
title('Domínio da Frequência - Com Filtro')
xlabel('W (rad/s)'); ylabel('Amplitude de X(e^j^W)');


audiowrite('vaf_fil.m4a',yf,fsg);