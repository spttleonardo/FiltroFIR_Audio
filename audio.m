fa = 11025;

% Duração da gravação em segundos
duration = 10;  

% Criar um objeto audiorecorder com as mesmas características
recObj = audiorecorder(fa, 16, 1);

% Iniciar a gravação
disp('Iniciando gravação...');
recordblocking(recObj, duration);
disp('Gravação concluída.');

% Obter os dados gravados
audioData = getaudiodata(recObj);

% Salvar o áudio em um arquivo WAV
filename = 'gravacao.wav';
audiowrite(filename, audioData, fa);

disp(['Áudio salvo em ', filename]);
