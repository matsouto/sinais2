clear
clc
hold on

% Carrega o audio
[yg,fsg] = audioread('vraf.m4a');

% Informa��es dos arquivos
info = audioinfo('vraf.m4a');
taxaAmostragem = fsg;
totalAmostras = extractfield(info,'TotalSamples');
duracao = extractfield(info,'Duration');

% Print de informa��es do audio
disp(['Taxa de Amostragem: ', num2str(taxaAmostragem)]);
disp(['Total de Amostras: ', num2str(totalAmostras)]);
disp(['Dura��o: ', num2str(duracao)]);

% Gr�fico no dom�nio do tempo e da frequ�ncia
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

%Plotagem no dom�nio do tempo
figure(1), clf;
subplot(2,1,1);plot(time,yg); grid minor
title('Dom�nio do Tempo - Com Ru�do')
xlabel('Tempo (s)');ylabel('Amplitude de X(KT)');
subplot(2,1,2);plot(time,yf); grid minor
title('Dom�nio do Tempo - Sem Ru�do');
xlabel('Tempo(s)');ylabel('Amplitude de X(KT)')

%Plotagem no dom�nio da frequ�ncia
figure(2), clf;
subplot(2,1,1); plot(f,abs(fourier_yg)); grid minor
title('Dom�nio da Frequ�ncia - Sem Filtro')
xlabel('W (rad/s)'); ylabel('Amplitude de X(e^j^W)'); axis([-4 4 0 1200]);
subplot(2,1,2); plot(f,abs(fourier_yf)); grid minor
title('Dom�nio da Frequ�ncia - Com Filtro')
xlabel('W (rad/s)'); ylabel('Amplitude de X(e^j^W)');


audiowrite('vaf_fil.m4a',yf,fsg);