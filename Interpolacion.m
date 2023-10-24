% Interpolacion.m
%Ejercicio de interpolacion para el reto
%Jorge Alberto
clear
clc
% Definir coordenadas
X = [3,5, 7,13 ,19,24];
Y = [4;4;4;4.5;5;5];
C = vander(X)\Y;
x_5 = C(1);
x_4 = C(2);
x_3 = C(3);
x_2 = C(4);
x_1 = C(5);
cte = C(6);
%Coordenadas desplazamiento
X3 = [2.6,4.6,6.6,12.6 ,18.6,23.6];
Y3 = [3.8;3.8;3.8;4.3;4.8;4.8];
C3 = vander(X3)\Y3;
x_5_3 = C3(1);
x_4_3 = C3(2);
x_3_3 = C3(3);
x_2_3 = C3(4);
x_1_3 = C3(5);
cte_3 = C3(6);
% Coordenadas parte interior vaso
X2 = [2,5, 7,13 ,19,24];
Y2 = [1.5;2;3;3.5;3.5;4];
C2 = vander(X2)\Y2;
x_5_2 = C2(1);
x_4_2 = C2(2);
x_3_2 = C2(3);
x_2_2 = C2(4);
x_1_2 = C2(5);
cte_2 = C2(6);
%Desplazamiento
X4 = [1.6,4.6,6.6,12.6,18.6,23.6];
Y4 = [1;1.5;2.5;3;3;3.5];
C4 = vander(X4)\Y4;
x_5_4 = C4(1);
x_4_4 = C4(2);
x_3_4 = C4(3);
x_2_4 = C4(4);
x_1_4 = C4(5);
cte_4 = C4(6);
%Displays
disp("-----------------------")
disp("Interpolacion No Lineal")
disp("-----------------------")
disp(" x^5 = "+x_5)
disp(" x^4 = "+x_4)
disp(" x^3 = "+x_3)
disp(" x^2 = "+x_2)
disp(" x^1 = "+x_1)
disp(" Constante = "+cte)
disp("---------------------------------------------------------------------------")
disp("y = "+x_5+"x^5 +"+x_4+"x^4 +"+x_3+"x^3 +"+x_2+"x^2 +"+x_1+"x "+cte)
disp("---------------------------------------------------------------------------")
disp("--------------------------------------------")
disp("Interpolacion No Lineal Parte interior vaso")
disp("--------------------------------------------")
disp(" x^5 = "+x_5_2)
disp(" x^4 = "+x_4_2)
disp(" x^3 = "+x_3_2)
disp(" x^2 = "+x_2_2)
disp(" x^1 = "+x_1_2)
disp(" Constante = "+cte_2)
disp("---------------------------------------------------------------------------")
disp("y = "+x_5_2+"x^5 +"+x_4_2+"x^4 +"+x_3_2+"x^3 +"+x_2_2+"x^2+"+x_1_2+"x "+cte_2)
disp("---------------------------------------------------------------------------")
disp("Ecuaciones de Desplazamiento, Y3, Y4")
disp("y3 = "+x_5_3+"x^5 +"+x_4_3+"x^4 +"+x_3_3+"x^3 +"+x_2_3+"x^2+"+x_1_3+"x "+cte_3)
disp("y4 = "+x_5_4+"x^5 +"+x_4_4+"x^4 +"+x_3_4+"x^3 +"+x_2_4+"x^2+"+x_1_4+"x "+cte_4)
disp("---------------------------------------------------------------------------")
%Graficas
%Coordenadas
plot(X,Y,"*r","linewidth",3)
hold on
plot(X2,Y2,"*r","linewidth",3)
hold on
plot(X3,Y3,"*r","linewidth",3)

plot(X4,Y4,"*r","linewidth",3)
hold on
%Funcion
X_eval = 0:0.1:24;
Y_eval = x_5*X_eval.^5 + x_4*X_eval.^4 + x_3*X_eval.^3 + x_2*X_eval.^2 + x_1*X_eval + cte;
Y_eval2 = x_5_2*X_eval.^5 + x_4_2*X_eval.^4 + x_3_2*X_eval.^3 + x_2_2*X_eval.^2 + x_1_2*X_eval + cte_2;
Y_eval3 = x_5_3*X_eval.^5 + x_4_3*X_eval.^4 + x_3_3*X_eval.^3 + x_2_3*X_eval.^2 + x_1_3*X_eval + cte_3;
Y_eval4 = x_5_4*X_eval.^5 + x_4_4*X_eval.^4 + x_3_4*X_eval.^3 + x_2_4*X_eval.^2 + x_1_4*X_eval + cte_4;
plot(X_eval, Y_eval,"b","linewidth",2)
hold on
plot(X_eval, Y_eval2,"b","linewidth",2)
hold on
plot(X_eval, Y_eval3,"b","linewidth",2)
hold on
plot(X_eval, Y_eval4,"b","linewidth",2)
camroll(90)

% cylinder(Y_eval)
% [x,y,z]=cylinder(Y_eval);
% surf(x,y,z,"FaceColor","texturemap","EdgeColor","interp")
% hold on
% cylinder(Y_eval2)
% ellipsoid(0,0,0,3,3,0)
%Integrales para sacar el volumen
f1=@(P) pi*(x_5*P.^5+x_4*P.^4+x_3*P.^3+x_2*P.^2+x_1*P+cte).^2;
V1_1=integral(f1,0,24);
f2=@(W) pi*(x_5_3*W.^5+x_4_3*W.^4+x_3_3*W.^3+x_2_3*W.^2+x_1_3*W+cte_3).^2;
V1_2=integral(f2,0,24);
f3=@(L) pi*(x_5_2*L.^5+x_4_2*L.^4+x_3_2*L.^3+x_2_2*L.^2+x_1_2*L+cte_2).^2;
V2_1=integral(f3,0,24);
f4=@(H) pi*(x_5_4*H.^5+x_4_4*H.^4+x_3_4*H.^3+x_2_4*H.^2+x_1_4*H+cte_4).^2;
V2_2=integral(f4,0,24);
V1= V1_2-V2_2;
V2= V1_1-V2_1;
disp("Resultados integrales")
disp("-----------------------------------------")
disp(V1_1+" Integral f1 0,24")
disp(V1_2+" Integral f2 0,24")
disp(V2_1+" Integral f3 0,24")
disp(V2_2+" Integral f4 0,24")
disp("-----------------------------------------")
disp("Costos de produccion")
disp("-----------------------------------------")
fprintf("Volumen interior ")
disp(V1+"Cm3")
fprintf("Volumen exterior ")
disp(V2+"Cm3")
Costo_m2= 429;
m2 = V1/1000;
Costo_V = m2*Costo_m2;
fprintf("Costo de el vaso ")
disp(Costo_V+" Pesos mexicanos")
disp("------------------------------------------")
