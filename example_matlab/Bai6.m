% Read the first audio file
[y1, fs1] = audioread('file1.wav');
% Decimate the audio
R = 3;
y1r = decimate(y1, R);
% Play the decimated audio
soundsc(y1r, fs1/R);

% Read the second audio file
[y2, fs2] = audioread('file2.wav');
% Decimate the audio
R = 3;
y2r = decimate(y2, R);
% Play the decimated audio
soundsc(y2r, fs2/R);

disp('Computing G6 model for the first audio');
na = 40;
nb = 40;

% Define chunk size
chunkSize = 10000; % Adjust as needed

% Compute number of chunks
numChunks1 = ceil(length(y1r) / chunkSize);
numChunks2 = ceil(length(y2r) / chunkSize);

% Initialize impulse responses
h1 = zeros(length(y1r), 1);
h2 = zeros(length(y2r), 1);

% Process chunks for the first audio
for i = 1:numChunks1
    chunkStart = (i - 1) * chunkSize + 1;
    chunkEnd = min(i * chunkSize, length(y1r));
    chunk = y1r(chunkStart:chunkEnd);
    
    % Compute power spectral density estimate
    [pxx, f] = pwelch(chunk, [], [], [], fs1/R);
    
    % Fit an autoregressive (AR) model
    [~, ~, sos_chunk] = tfestimate(pxx, pxx, [], [], na, 'twosided');
    
    % Update impulse response
    h1(chunkStart:chunkStart+size(sos_chunk,1)-1) = sos_chunk(:,1); % Store only the first column of sos_chunk
end

% Process chunks for the second audio
for i = 1:numChunks2
    chunkStart = (i - 1) * chunkSize + 1;
    chunkEnd = min(i * chunkSize, length(y2r));
    chunk = y2r(chunkStart:chunkEnd);
    
    % Compute power spectral density estimate
    [pxx, f] = pwelch(chunk, [], [], [], fs2/R);
    
    % Fit an autoregressive (AR) model
    [~, ~, sos_chunk] = tfestimate(pxx, pxx, [], [], na, 'twosided');
    
    % Update impulse response
    h2(chunkStart:chunkStart+size(sos_chunk,1)-1) = sos_chunk(:,1); % Store only the first column of sos_chunk
end

% Plot the impulse responses
subplot(2,1,1);
plot(h1);
title('beach-pianowav model(Day la ket qua cua Van Quang va Anh Tuan) ');
soundsc(h1);

subplot(2,1,2);
plot(h2);
title('the-last-piano model(Day la ket qua cua Van Quang va Anh Tuan)');
soundsc(h2);

pause(1);

% Play the first and second audio alternately for 5 times
for n = 1:5
    soundsc(h1);
    pause(0.4);
    soundsc(h2);
    pause(0.4);
end