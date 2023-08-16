clc;
clear;
%Starting and ending point using Inv_Kin_Scara function
[T1S,T2S,DS] = Inv_Kin_Scara(40,5,15);
[T1E,T2E,DE] = Inv_Kin_Scara(-10,38,25);
%Trajectory by time for any sym
syms t x y z;
%Achieving Trajectory function for different periods of time
%Timezone(a) t = 0:1
    %for T1(t)
    a0 = T1S;
    [a3, a4, a5] = solve([3*x+6*y+10*z==0 3*x+4*y+5*z==0 a0+x+y+z==T1E],[x y z]);
    T1a(t) = a0 + a3*t^3 + a4*t^4 + a5*t^5;
    %for T2(t)
    a0 = T2S;
    [a3, a4, a5] = solve([3*x+6*y+10*z==0 3*x+4*y+5*z==0 a0+x+y+z==T2E],[x y z]);
    T2a(t) = a0 + a3*t^3 + a4*t^4 + a5*t^5;
    %for D(t)
    a0 = DS;
    [a3, a4, a5] = solve([3*x+6*y+10*z==0 3*x+4*y+5*z==0 a0+x+y+z==DE],[x y z]);
    Da(t) = a0 + a3*t^3 + a4*t^4 + a5*t^5;
%Timezone(b) t = 1:3
    T1b(t) = T1E;
    T2b(t) = T2E;
    Db= DE;
%Timezone(c) and after that(doesnt care) t = 3:4
    %for T1(t)
    a0 = T1S;
    [a3, a4, a5] = solve([3*x+6*y+10*z==0 3*x+4*y+5*z==0 a0+x+y+z==T1E],[x y z]);
    T1c(t) = a0 + a3*(-t+4)^3 + a4*(-t+4)^4 + a5*(-t+4)^5;
    %for T2(t)
    a0 = T2S;
    [a3, a4, a5] = solve([3*x+6*y+10*z==0 3*x+4*y+5*z==0 a0+x+y+z==T2E],[x y z]);
    T2c(t) = a0 + a3*(-t+4)^3 + a4*(-t+4)^4 + a5*(-t+4)^5;
    %for D(t)
    a0 = DS;
    [a3, a4, a5] = solve([3*x+6*y+10*z==0 3*x+4*y+5*z==0 a0+x+y+z==DE],[x y z]);
    Dc(t) = a0 + a3*(-t+4)^3 + a4*(-t+4)^4 + a5*(-t+4)^5;
    %Results of location, velocity and acceleration for each joint
    disp('For timezone(a):')
    T1a(t) = T1a(t)
    v_T1a(t) = diff(T1a(t),t)
    a_T1a(t) = diff(v_T1a(t),t)
    T2a(t) = T2a(t)
    v_T2a(t) = diff(T2a(t),t)
    a_T2a(t) = diff(v_T2a(t),t)
    Da(t) = Da(t)
    v_Da(t) = diff(Da(t),t)
    a_Da(t) = diff(v_Da(t),t)
    disp('For timezone(b):')
    T1b(t) = T1b(t)
    v_T1b(t) = diff(T1b(t),t)
    a_T1b(t) = diff(v_T1b(t),t)
    T2b(t) = T2b(t)
    v_T2b(t) = diff(T2b(t),t)
    a_T2b(t) = diff(v_T2b(t),t)
    Db = Db
    v_Db = diff(Db,t)
    a_Db = diff(v_Db,t)
    disp('For timezone(c):')
    T1c(t) = T1c(t)
    v_T1c(t) = diff(T1c(t),t)
    a_T1c(t) = diff(v_T1c(t),t)
    T2c(t) = T2c(t)
    v_T2c(t) = diff(T2c(t),t)
    a_T2c(t) = diff(v_T2c(t),t)
    Dc(t) = Dc(t)
    v_Dc(t) = diff(Dc(t),t)
    a_Dc(t) = diff(v_Dc(t),t)
