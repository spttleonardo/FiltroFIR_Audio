function [S, frequency] = my_fft(s, fs)

% Comprimento do sinal
normal = length(s);

% Vetor de frequências
aux = 0:normal-1;
T = normal/fs;
frequency = aux/T;

% Cálculo da FFT e normalização
S = fft(s)/normal;

% Frequências positivas apenas
fc = ceil(normal/2);
S = S(1:fc);
frequency = frequency(1:fc);

% Plotagem do espectro
figure();
plot(frequency, abs(S));
title('Análise de Espectro');
xlabel('Frequência em Hz');
ylabel('Amplitude');

end
