%% Plot the Sinusoidal signal
% Signal parameters
f0=1;
A=2;
phi0=3;
% Instantaneous frequency after 1 sec is 
maxFreq = 2*pi*f0;
sampFreq = 5*maxFreq;
sampIntrv = 1/sampFreq;

% Time samples
timeVec = 0:sampIntrv:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = SS(timeVec,A,phi0,f0);

%Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);
