clear
% Carrega o audio
[yaf,fsaf] = audioread('vraf.m4a');

% Informa��es dos arquivos
infoaf = audioinfo('vraf.m4a');
taxaAmostragemaf = extractfield(infog,'SampleRate');
totalAmostrasaf = extractfield(infog,'TotalSamples');
duracaoaf = extractfield(infog,'Duration');