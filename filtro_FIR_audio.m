% Filtro passa baixa FIR

% 11025Hz - Devo analisar se a frequencia de amostragem é o dobro da
% frequencia  maxima do nosso sinal no espectro
% Teorema de Nyquist - A frequencia de amostragem deve ser o dobro da freq
% do sinal se nao vai ter perda
fsamp = fa;
s1 = audioData;

fp = 250; % frequencia de passagem
fs = 350; % frequencia de corte

% normalizando em unidade de pi
wp=(fp/(fsamp/2))*pi;
ws=(fs/(fsamp/2))*pi;

% frequencia de transicao
wt = ws - wp;

M = ceil((6.6*pi/wt))+1; % valor de 6.6 é tabelado para janela de hamming

% frequencia de corte intermediaria
wc = (ws + wp)/2;

hd = my_lowpass_ideal(wc,M); % funcao sinc para passa baixa ideal

w_hamm = hamming(M)'; % Calcula a janela de hamming

h = hd.*w_hamm; % faz a multiplicacao entre os vetores (h ja apresenta a funcao impulso sem os globulos)

s1_filtrado = conv(h,s1); % convolucao entre os sinais

my_fft(s1_filtrado,fsamp);


plot(s1_filtrado)
sound(s1_filtrado, fa);

