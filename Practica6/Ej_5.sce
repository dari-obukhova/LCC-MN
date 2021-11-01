clear 

// Una función que usa el metodo de la potencia 
// para calcular el autovalor dominante 
// y el autovector asociado 

// Input: 
// A - matriz n X n 
// z0 - una estimación inicial del autovector 
// eps - una cota del error 
// maxiter - número maximo de iteraciones

// Outut:
// valor - un autovalor de módulo maximo
// zn - autovector asociado a este autovalor 


function [valor,zn] = mpotencia(A,z0,eps,maxiter)
    
    valor = 0
    iter = 1 
    
    w = A * z0
    zn = w/norm(w,%inf) // primera aproximación de autovector
    
    // k - la max componente de w 
    
    [m,j] = max(abs(w))
    
    valor = m/z0(j) // z0(j) /= 0!!; primera aproximación de autovalor
    
    while ((iter <= maxiter) & (norm(z0 - zn, %inf) > eps))
        
        z0 = zn
        w = A * z0
        
        zn = w/norm(w,%inf)  
        [m,j] = max(abs(w))
        valor = m/z0(j)
        
        iter = iter + 1
    end
    
    printf("\n iteraciones: ")
    disp(iter)
endfunction

// Ejemplo 

printf("\n Ejemplo: \n")

M1 = [1 2 3; 4 5 6; 3 4 5]

disp(M1)

[lamb,vect] = mpotencia(M1, [1,0,0]', 0.000001, 1000)

printf("\n Valores obtenidos usando el Método de la Potencia: \n")
printf("\n autovalor: ")
disp(lamb)

printf("\n autovector: ")
disp(vect)

printf("\n Valores obtenidos upor Scilab: \n")
[vect, lamb] = spec(M1)
printf("\n autovalores: ")
disp(lamb)

printf("\n autovectores: ")
disp(vect)

printf("\n __________________________ \n")


// item (a) 

A1 = [6 4 4 1; 4 6 1 4; 4 1 6 4; 1 4 4 6]

disp(A1)

[lamb,vect] = mpotencia(A1, [1,0,0,0]', 0.000001, 1000)

printf("\n Valores obtenidos usando el Método de la Potencia: \n")
printf("\n autovalor: ")
disp(lamb)

printf("\n autovector: ")
disp(vect)

printf("\n Valores obtenidos upor Scilab: \n")
[vect, lamb] = spec(A1)
printf("\n autovalores: ")
disp(lamb)

printf("\n autovectores: ")
disp(vect)


A2 = [12 1 3 4; 1 -3 1 5; 3 1 6 -2; 4 5 -2 -1]

disp(A2)

[lamb,vect] = mpotencia(A2, [1,0,0,0]', 0.000001, 1000)

printf("\n Valores obtenidos usando el Método de la Potencia: \n")
printf("\n autovalor: ")
disp(lamb)

printf("\n autovector: ")
disp(vect)

printf("\n Valores obtenidos upor Scilab: \n")
[vect, lamb] = spec(A2)
printf("\n autovalores: ")
disp(lamb)

printf("\n autovectores: ")
disp(vect)



function [valor,zn] = mpotencia2(A,z0,eps,maxiter)
    
    lambda = max(spec(A))
    
    valor = 0
    iter = 1 
    
    w = A * z0
    zn = w/norm(w,%inf) 
    
    
    [m,j] = max(abs(w))
    
    valor = m/z0(j) // z0(j) /= 0!!
    
    er = abs(lambda-valor)

    while ((iter <= maxiter) & (er > eps))
        
        z0 = zn
        w = A * z0
        
        zn = w/norm(w,%inf)  
        [m,j] = max(abs(w))
        valor = m/z0(j)
        
        iter = iter + 1
        er = abs(lambda-valor);
    end
    
    disp("iteraciones: ", iter)
endfunction


// Considerando error maximo 
// entre e
      
function [valor,zn] = mpotencia2(A,z0,eps,maxiter)
    
    lambda = max(spec(A))
    
    valor = 0
    iter = 1 
    
    w = A * z0
    zn = w/norm(w,%inf) 
    
    
    [m,j] = max(abs(w))
    
    valor = m/z0(j) // z0(j) /= 0!!
    
    er1 = abs(lambda-valor)
    er2 = norm(z0 - zn, %inf)
    
    er = max(er1, er2)

    while ((iter <= maxiter) & (er > eps))
        
        z0 = zn
        w = A * z0
        
        zn = w/norm(w,%inf)  
        [m,j] = max(abs(w))
        valor = m/zn(j)
        
        iter = iter + 1
        
        er1 = abs(lambda-valor) // error del autovalor
        er2 = norm(z0 - zn, %inf) // error del autovector asociado 
    
        er = max(er1, er2)
    end
    
    disp("iteraciones: ", iter)
endfunction      
      
