function [teta1,teta2,d] = Inv_Kin_Robotx(x,y,z)
l = sqrt(x^2 + y^2);
tta2 = [acos((l^2-30^2-25^2)/(2*30*25)),-acos((l^2-30^2-25^2)/(2*30*25))];
alpha = atan2(y,x);
tta1 = alpha - atan2(25*sin(tta2),(30+25*cos(tta2)));
%   for obtaining d
d = 30-z;
%   when there is only one answer
if (length(tta1)==1)
    teta1=tta1*180/pi;
    teta2=tta2*180/pi;
%   for choosing smaller value for teta1
elseif (abs(tta1(1))<=abs(tta1(2)))
    teta1=tta1(1)*180/pi;
    teta2=tta2(1)*180/pi;
    else
    teta1=tta1(2)*180/pi;
    teta2=tta2(2)*180/pi;
end
