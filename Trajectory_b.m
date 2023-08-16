clc;
clear;
g = 9.8;
Vmax = 0.3; %m/s
Amax = g/2; %m/s^2
Smax = sqrt(((25-15)^2) + ((38-5)^2) +  ((-10-40)^2))*0.01
%Finding time constants
ta = Vmax/Amax
td = Smax/Vmax
tf = ta+td
%Time zone (a) t = 0:ta
if t>=0 && t<ta
    S = vpa(0.5*Amax*t^2);
%Time zone (b) t = ta:td
elseif t>=ta && t<td
    S = vpa(Vmax*(t-0.5*ta));
%Time zone (c) t = td:tf
elseif t>=td && t<tf
    S = vpa(Vmax*(t-td)-0.5*Amax*(t^2-td^2)+Amax*td*(t-td)+Vmax*(td-0.5*ta));
%Time zone (zero) t = tf:tf+2
elseif t>=tf && t<tf+2
    S = Smax*100;
%Time zone (d) t = tf+2:tf+ta+2
elseif t>=tf+2 && t<tf+ta+2
    S = Smax*100-vpa(0.5*Amax*(t-tf-2)^2);
%Time zone (e) t = tf+ta+2:tf+td+2
elseif t>=tf+ta+2 && t<tf+td+2
    S = Smax*100-vpa(Vmax*(t-tf-2-0.5*ta));
%Time zone (f) t = tf+td+2:2*tf+2
elseif t>=tf+td+2 && t<=2*tf+2
    S = Smax*100-vpa(Vmax*(t-tf-2-td)-0.5*Amax*((t-tf-2)^2-td^2)+Amax*td*((t-tf-2)-td)+Vmax*(td-0.5*ta));
%Time zone (out of range)
else
    S = 0;
end
%finding location
X = vpa([40 5 15]+(([-0.1 0.38 0.25]-[0.4 0.05 0.15])/Smax)*S);
%finding joint values
[T1, T2, D] = Inv_Kin_Scara(X(1),X(2),X(3));
