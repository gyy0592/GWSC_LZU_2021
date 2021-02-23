%% Plot the Sinusoidal signal
% Signal parameters
f0=10;
f1=0.1
% Time samples ,generate a set of discrete number for signal.
timeVec = 0:0.01:1.0;


% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = testsg(timeVec,f0,f1);

% Find max value of frequency in [0,1] in numerical way
wmax=( sigVec(3)-sigVec(1) )/ ( 0.01*2 )
for i=2:nSamples-2
    wnow=( sigVec(i+2)-sigVec(i) ) / ( 0.01*2 )
    if wnow>wmax
        wmax=wnow
    end
end
Bestguess=2*wmax
% If function of source is known:
%derivative of function=def
%def(x)=diff(f(x))
%To find max value of def,we can use monte-carlo, pso or other algorithm
%Here I won't give a specific solution.



% Instantaneous frequency after 1 sec is 
maxFreq = wmax
NyquistFreq=2*maxFreq
sampFreq = 5*NyquistFreq;
sampIntrv = 1/sampFreq;

% Time samples
timeVec = 0:sampIntrv:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = testsg(timeVec,f0,f1);
    
% Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);

%Plot the periodogram
%--------------
%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));

%Plot a spectrogram
% %----------------
winLen = 1%sec
ovrlp = 0.1;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*sampFreq);
ovrlpSmpls = floor(ovrlp*sampFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],sampFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');



%for 1/2 of the Nyquist sampling frequency
maxFreq = wmax
NyquistFreq=2*maxFreq
sampFreq = 1/2*NyquistFreq;
sampIntrv = 1/sampFreq;

% Time samples
timeVec = 0:sampIntrv:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = testsg(timeVec,f0,f1);
    
% Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);

%Plot the periodogram
%--------------
%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));

%Plot a spectrogram
%----------------
winLen = 1;%sec
ovrlp = 0.1;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*sampFreq);
ovrlpSmpls = floor(ovrlp*sampFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],sampFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');

