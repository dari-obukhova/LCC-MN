clear 

// La función que resueve sistemas de ecuaciines lineales 
// usando el método iterativo de Jacobi 

// Input: 
// A - matriz de coefficientes
// b - vector 
// x0 - estimación inicial de x 
// eps - tolerancia de un error 

// Output:
// x - solución de ecuaciones lineales

function x = jacobi(A,b,x0,eps)
    n = size(A,1)
    x = x0 
    xk = x
    count = 0 
    
    for i=1:n
        x(i) = (1/A(i,i))*(b(i) - A(i,:)*xk + A(i,i) * x(i))
    end
    
    count = count+1
    
    while (norm(x-xk)>eps)
        xk = x
        
        for i=1:n 
            x(i) = (1/A(i,i))*(b(i) - A(i,:)*xk + A(i,i) * x(i))
        end
        count = count + 1
    end
    printf("Número de iteraciones: ")
    disp(count)
endfunction


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
    
    printf("Número de iteraciones: ")
    disp(count)
endfunction

A = [10 1 2 3 4; 1 9 -1 2 -3; 2 -1 7 3 -5; 3 2 3 12 -1; 4 -3 -5 -1 15]
b = [12 -27 14 -17 12]'

x0 = [0 0 0 0 0]'
eps = 10^(-6)

x_j = jacobi(A, b, x0, eps)

printf("La solución de A*x=b aplicando el método de Jacobi:")
disp(x_j)

x_g = gauss_seidel(A, b, x0, eps)

printf("La solución de A*x=b aplicando el método de Gauss-Seidel:")
disp(x_g)
