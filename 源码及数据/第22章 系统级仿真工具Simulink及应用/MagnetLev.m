function  my_Plant=MagnetLev
m=0.1; g=9.82; R=5;
L=0.04; k=0.01; h0=0.02;
i0=h0*sqrt(m*g/k);
A=[0 1 0;2*k*i0^2/(m*h0^3) 0 -2*k*i0/(m*h0^2);0 0 -R/L];
B=[0;0;1/L];
C=[1 0 0];
D=0;
my_Plant=ss(A,B,C,D);

% MagPoles=pole(MagnetLev)
% PD=tf(-1*[1 20],[1 50]);
% rlocus(PD*MagnetLev);
% sgrid
% title('Root locus of PD Controller magnetic levitator');
% xlabel('Real axis');
% ylabel('Imaginary axis');
% 
% 
% rlocus(tf(-1*[1 20],[1 50])*MagnetLev)
% rlocfind(tf(-1*[1 20],[1 50])*MagnetLev)
% 
% PD=tf(-1*[1 20],[1 50]);
% PI=tf([1 1],[1 0]);
% [y,t]=impulse(feedback(150*PI*PD*MagnetLev,1));
% plot(t,y);
% grid;
% xlabel('Time');
% ylabel('Impulse response');
% title('Impulse response of a magnetic levitator');

