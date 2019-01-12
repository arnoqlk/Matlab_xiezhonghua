function m = Findm
w = [pi/2,pi,pi*1.5];
N = [pi/2-1,-2,-1.5*pi-1]; 
function y = ObjecFun(m)
    y = (quadl(@(t) t.^m.*cos(t),0,w(1))-N(1))^2 + (quadl(@(t) t.^m.*cos(t),0,...
        w(2))-N(2))^2 + (quadl(@(t) t.^m.*cos(t),0,w(3))-N(3))^2;
end
m = fminbnd(@ ObjecFun,0,2);
end
