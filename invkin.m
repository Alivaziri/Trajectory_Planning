function q = invkin(x,y,z)
L1=0.3;
L2=0.3;
L3=0.25;
if (x==0 && y==0)
    teta1=0;
    teta2=0;
    d=L1-z;
    q=[teta1,teta2,d];
    return   
end
beta = atan2d(  y/(x^2+y^2)^0.5  ,  x/(x^2+y^2)^0.5 );
teta2= [acosd( (x^2+y^2-(L2)^2-(L3)^2) / ( 2*(L2)*(L3) ) ),-acosd( (x^2+y^2-(L2)^2-(L3)^2) / ( 2*(L2)*(L3) ) )];
teta1= beta-atan2d(  ((L3*sind(teta2))/(x^2+y^2)^0.5)  ,  ((L2+L3*cosd(teta2))/(x^2+y^2)^0.5)  ) ;
d=L1-z;
q=[ teta1(1,1),teta2(1,1),d ; teta1(1,2),teta2(1,2),d ] ;
end
