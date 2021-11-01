clear

// Ejercicio 5

// item (a)

function [x,a] = gausselimPP(A,b)
// Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
// dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana con pivoteo parcial.

[nA,mA] = size(A) 
[nb,mb] = size(b)

if nA<>mA then
    error('gausselim - La matriz A debe ser cuadrada');
    abort;
elseif mA<>nb then
    error('gausselim - dimensiones incompatibles entre A y b');
    abort;
end;

a = [A b]; // Matriz aumentada
n = nA;    // Tamaño de la matriz

// Eliminación progresiva con pivoteo parcial
for k=1:n-1
    kpivot = k; amax = abs(a(k,k));  //pivoteo
    for i=k+1:n
        if abs(a(i,k))>amax then
            kpivot = i; amax = a(i,k);
        end;
    end;
    temp = a(kpivot,:); a(kpivot,:) = a(k,:); a(k,:) = temp;
    
    for i=k+1:n
        for j=k+1:n+1
            a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k);
        end;
        for j=1:k        // no hace falta para calcular la solución x
            a(i,j) = 0;  // no hace falta para calcular la solución x
        end              // no hace falta para calcular la solución x
    end;
end;

// Sustitución regresiva
x(n) = a(n,n+1)/a(n,n);
for i = n-1:-1:1
    sumk = 0
    for k=i+1:n
        sumk = sumk + a(i,k)*x(k);
    end;
    x(i) = (a(i,n+1)-sumk)/a(i,i);
end;
endfunction

// Ejemplos de aplicación
A4 = [0 2 3; 2 0 3; 8 16 -1]
b4 = [7 13 -3]'

[x4,a4] = gausselimPP(A4,b4)

printf("\n Resoluión de A4*x = b4: ")
disp(x4)
disp(a4)

A5 = [2 -2 0; 1 -1 1; 0 3 -2]
b5 = [-6 1 -5]'

[x5,a5] = gausselimPP(A5,b5)

printf("\n Resoluión de A5*x = b5: ")
disp(x5)
disp(a5)
// ans = [-2, 1, 4]'



// item (b)

A1 = [1 1 0 3; 2 1 -1 1; 3 -1 -1 2; -1 2 3 -1]
b1 = [4 1 -3 4]'

[x1,a1] = gausselimPP(A1,b1)
printf("\n La solución de A1*x = b1: ")
disp(x1)
//disp(a1)

printf("\n A1*x1 : ")
disp(A1*x1)

printf("\n b1 : ")
disp(b1)

A2 = [1 -1 2 -1; 2 -2 3 -3; 1 1 1 0; 1 -1 4 3]
b2 = [-8 -20 -2 4]'

[x2,a2] = gausselimPP(A2,b2)
printf("\n La solución de A2*x = b2: ")
disp(x2)
//disp(a2)

printf("\n A2*x2 : ")
disp(A2*x2)

printf("\n b2 : ")
disp(b2)

A3 = [1 1 0 4; 2 1 -1 1; 4 -1 -2 2; 3 -1 -1 2]
b3 = [2 1 0 -3]'

[x3,a3] = gausselimPP(A3,b3)
printf("\n La solución de A3*x = b3: ")
disp(x3)
//disp(a3)

printf("\n A3*x3 : ")
disp(A3*x3)

printf("\n b3 : ")
disp(b3)

