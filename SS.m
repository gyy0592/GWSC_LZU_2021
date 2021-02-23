function sigVec = SS(dataX,A,phi0,f0)
% Generate a quadratic chirp signal
% S = SS(X,SNR,phi0,f0)
% Generates a Sinusoidal signal. X is the vector of
% time stamps at which the samples of the signal are to be computed. A is
% the matched filtering signal-to-noise ratio of S and C is the vector of


%Barry Guo, Feb 2021

sigVec = sin(2*pi*f0*dataX+phi0);
sigVec = A*sigVec/norm(sigVec);
