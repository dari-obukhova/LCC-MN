clear 


// Esta función obtiene la solución del sistema de ecuaciones lineales A*x=b, 
// dada la matriz de coeficientes A y el vector b.
// La función implementa el método de Eliminación Gaussiana con pivoteo parcial.

function [x,a] = gausselimPP(A,b)

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
//A4 = [0 2 3; 2 0 3; 8 16 -1]
//b4 = [7 13 -3]'

//[x4,a4] = gausselimPP(A4,b4)

//printf("\n Resoluión de A4*x = b4: ")
//disp(x4)
//disp(a4)

//A5 = [2 -2 0; 1 -1 1; 0 3 -2]
//b5 = [-6 1 -5]'

//[x5,a5] = gausselimPP(A5,b5)

//printf("\n Resoluión de A5*x = b5: ")
//disp(x5)
//disp(a5)
// ans = [-2, 1, 4]'


//printf("__________________________________________________\n")



// La función que resuelve sistemas de ecuaciones lineales 
// aplicando el método de Gauss-Seidel

// Input: 
// A - matriz de coefficientes
// b - vector 
// x0 - estimación inicial de x 
// eps - tolerancia de un error 

// Output:
// x - solución de ecuaciones lineales

function x = gauss_seidel(A,b,x0,eps)
    n = size(A,1)
    x = x0 
    xk = x
    count = 0 
    
    x(1) = (1/A(1,1))*(b(1) - A(1,2:n)*xk(2:n))   
        
        for i=2:n-1
            x(i) = (1/A(i,i)) * (b(i)  - A(i,1:i-1)*x(1:i-1) - A(i, i+1:n)*xk(i+1:n))
        end
        
        x(n) = (1/A(n,n)) * (b(n) - A(n,1:n-1)*x(1:n-1)) 
        
        count = count+1
    
    while (norm(x-xk)>eps)
        
        xk = x

        x(1) = (1/A(1,1))*(b(1) - A(1,2:n)*xk(2:n))   
        
        for i=2:n-1
            x(i) = (1/A(i,i)) * (b(i)  - A(i,1:i-1)*x(1:i-1) - A(i, i+1:n)*xk(i+1:n))
        end
        
        x(n) = (1/A(n,n)) * (b(n) - A(n,1:n-1)*x(1:n-1)) 
        
        count = count+1
        
    end
    
    printf("\n Número de iteraciones: ")
    disp(count)
endfunction

// Ejemplos 

printf("\n Ejemplo de la aplicación del método de Gauss-Seidel: \n")

A1 = [4 -3 -2; -3 8 1; -1 3 8]
b1 = [4 9 -5]'

printf("\n A1: \n")
disp(A1)
printf("\n b1: \n")
disp(b1)

x = gauss_seidel(A1,b1, [0 0 0]', 10^(-5))
printf("\n Solución de A1*x=b1 aplicando el método de Gauss-Seidel: \n")
disp(x)
printf("\n A1*x: \n")
disp(A1*x)

printf("\n ______________________________________ \n")

// La función que crea una matriz A y un vector b
// con las condiciones especificadas en el Ejercicio 4

// Input: 
// N - un número entero 

// Output: 
// A - matriz n x n
// b - un vector 

function [A,b] = matrix4(N)
    A = 8*eye(N,N) + 2 * diag(ones(N-1,1),1) + 2 * diag(ones(N-1,1),-1) + diag(ones(N-3,1),3) + diag(ones(N-3,1),-3)
    b = ones(N,1)
endfunction

x0 = zeros(100,1)
eps1 = 10^(-6)
eps2 = 10^(-11)

N1 = 100
[A,b] = matrix4(N1)

tic()
x = gauss_seidel(A,b,x0,eps1)
t=toc()

printf("\n El tiempo de resolución para N = %d, eps = %f, aplicando Gauss-Seidel : ", N1, eps1)
disp(t)

tic()
x = gauss_seidel(A,b,x0,eps2)
t=toc()

printf("\n El tiempo de resolución para N = %d, eps = %.11f, aplicando Gauss-Seidel : ", N1, eps2)
disp(t)

tic()
x = gausselimPP(A,b)
t=toc()

printf("\n El tiempo de resolución para N = %d, aplicando eliminación de Gauss : ", N1)
disp(t)

N2 = 500
[A,b] = matrix4(N2)
x0 = zeros(500,1)

tic()
x = gauss_seidel(A,b,x0,eps1)
t=toc()

printf("\n El tiempo de resolución para N = %d, eps = %f, aplicando Gauss-Seidel : ", N2, eps1)
disp(t)

tic()
x = gauss_seidel(A,b,x0,eps2)
t=toc()

printf("\n El tiempo de resolución para N = %d, eps = %.11f, aplicando Gauss-Seidel : ", N2, eps2)
disp(t)

tic()
x = gausselimPP(A,b)
t=toc()

printf("\n El tiempo de resolución para N = %d, aplicando eliminación de Gauss : ", N2)
disp(t)


//El tiempo de resolución para N = 100, eps = 0.000001, aplicando Gauss-Seidel : 
//   0.0375209999999999987974

// El tiempo de resolución para N = 100, eps = 0.00000000001, aplicando Gauss-Seidel : 
//   0.0452760000000000037423

// El tiempo de resolución para N = 100, aplicando eliminación de Gauss : 
//   1.1869000000000000660805

// El tiempo de resolución para N = 500, eps = 0.000001, aplicando Gauss-Seidel : 
//   0.2201909999999999978382

// El tiempo de resolución para N = 500, eps = 0.00000000001, aplicando Gauss-Seidel : 
//   0.4748510000000000230713

// El tiempo de resolución para N = 500, aplicando eliminación de Gauss : 
//   143.71134099999997602026


