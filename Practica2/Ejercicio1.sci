clear 
clc

// Calcula las raíces de una ecuación cuadratica
// 
// Input: [a,b,c] , donde a,b,c - coefficientes de una ecuación cuadratica. ax² + bx + c = 0 
// Output: [x1, x2], donde x1, x2 - ra;ices de la ecuación cuadratica

function r = raices(p)
    c = coeff(p,0);
    b = coeff(p,1);
    a = coeff(p,2);
    if b < 0 then r(1) = (2*c) / (-b + sqrt(b^2-4*a*c));
        r(2) = (-b + sqrt(b^2-4*a*c))/(2*a);
    else r(1) = (-b - sqrt(b^2-4*a*c))/(2*a);
         r(2) = (2*c) / (-b - sqrt(b^2-4*a*c));
    end
endfunction



// Calculo del raiz positivo del polinomio ǫx2 + (1/ǫ)x − ǫ = 0
// donde ǫ = 0.0001
// Estimación del error.  

z = 0.0001;
p = poly([-z 1/z z], 'x', 'coeff');
p2 = poly([-5 -4 1], 'x', 'coeff');
respuesta = raices(p2)
printf("respuesta pra p2: %f \n", respuesta)
//p = poly([-0.0001 10000.0 0.0001],"x","coeff");
[-0.0001 10000.0 0.0001]
e1 = 1e-8;
roots1 = raices(p);
r1 = roots1(2);
roots2 = roots(p);
r2 = roots2(2);
error1 = abs(r1-e1)/e1;
error2 = abs(r2-e1)/e1;

printf("raices (mi función): %e (error = %e) \n", r1, error1);
printf("roots (Scilab) : %e (error = %e) \n", r2, error2);
