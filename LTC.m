function sigVec = LTC(dataX,A,ta,f0,f1,phi0,L)
% Generate a quadratic chirp signal
% S = LTC(dataX,A,ta,f0,f1,phi0,L)
% Generates a Linear transient chirp. X is the vector of
% time stamps at which the samples of the signal are to be computed. A is
% the matched filtering signal-to-noise ratio of S and C is the vector of

num=length(dataX);
%Barry Guo, Feb 2021
for i=1:num 
   if (dataX(i)>ta+L)||(dataX(i)<ta )
   dataX(i)=dataX(i)
   else 
   dataX(i)=0
   end
end
 Vec1=2*pi*(f0*(dataX-ta)+f1*(dataX-ta).^2+phi0);
 sigVec = A*sin(Vec1+phi0);

