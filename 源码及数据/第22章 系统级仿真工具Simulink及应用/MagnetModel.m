function [sys,x0]=MagnetModel(t,x,u,flag)
m=0.1; g=9.82; R=5;
L=0.04; k=0.01; h0=0.02;
i0=h0*sqrt(m*g/k);
switch flag
    case 1
        xdot=zeros(3,1);
        xdot(1)=x(2);
        xdot(2)=m*g-k*x(3)^2/x(1)^2;
        xdot(3)=-R/L*x(3)+1/L*u(1);
        sys=xdot;
    case 3
        sys=x(1);
    case 0
        sys=[3 0 1 1 0 0];
        x0=[h0+0.1*h0;0;i0];
    otherwise
        sys=[];
end

% PD=tf(-1*[1 20],[1 50]);
% PI=tf([1 1],[1 0]);
% v0=0.991;h0=0.02;
% [num,den]=tfdata(150*PD*PI,'v');
%  
% 
% plot(Time,50*Height,'k-',Time,Vapp,'k-.')
% legend('50h(t)','v(t)');
% text(1,1.5,'Initial conditions');
% text(1.2,1.45,'h(0)=0.022m');
% text(1.2,1.4,'v(0)=0.991 V');
% xlabel('Time');
% ylabel('Impulse response');
% axis([0 4 0.7 1.6]);