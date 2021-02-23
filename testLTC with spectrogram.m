%% Plot the Linear transient chirp
% Signal parameters
f0=1;
A=2;
phi0=3;
f1=2;
ta=1;
L=1;
% Instantaneous frequency after 1 sec is 
sampFreq = 100*f0;
sampIntrv = 1/sampFreq;

% Time samples
timeVec = 0:sampIntrv:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = LTC(timeVec,A,ta,f0,f1,phi0,L)

%Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);

%Plot the periodogram
%--------------
%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
%NFFT = floor(nSamples/2)+1;
NFFT = 2^nextpow2(nSamples); 
% Positive Fourier frequencies
posFreq = sampFreq/NFFT*(1:NFFT/2);
% FFT of signal
fftSig = fft(sigVec)/nSamples;
% Discard negative frequencies
fftSig = fftSig(1:NFFT/2);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));
axis xy;
xlabel('Frequency (Hz)');
ylabel('Amplitude');
%Plot a spectrogram
%----------------
winLen = 0.001;%sec
ovrlp = [];%sec



%Convert to integer number of samples 
winLenSmpls = floor(winLen*sampFreq);
ovrlpSmpls = floor(ovrlp*sampFreq);

%Make sure winLen is greater than 1 and smaller  than sample length
if winLenSmpls<=1 
    winLenSmpls=2;
end
if winLenSmpls > length(sigVec)
    winLenSmpls=length(sigVec)-1;
end
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],sampFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
