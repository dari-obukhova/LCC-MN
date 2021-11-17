clear 

//Ejercicio 7 

// La función que encuentra el polinomio de aproximación 
// usando el Metodo de Minimos Cuadrados 

// Input: 
// x - el vector 
// y - el vector 
// p - grado de polinomio 

// Output: 
// p - polinomio de aproximación 
// err - vector de errores (eps = Ax-b)

function [p,err] = minCuadrados(x,y,p)
    [m,n] = size(x)
    
    // Encontramos la matriz A, donde a_ij = Ф_j(x_i) = (x_i)^j
    A = zeros(n,p+1)
    for i = 1:n
        for j = 0:p
            A(i,j+1) = x(i)^j
        end
    end
    
    // Usamos el Teorema 2 para encontrar coeficientes del polinomio 
    // A' * A * x = A' * b 
    
    [w,a] = gausselimPP((A')*A,(A')*(y'))
    p = poly(w,"x","coeff")
    err = A*w-y'   
endfunction


function [x,a] = gausselimPP(A,b)
[nA,mA] = size(A) 
[nb,mb] = size(b)
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
    temp = a(kpivot,:); a(kpivot,:) = a(k,:);
    a(k,:) = temp
    
    for i=k+1:n
        for j=k+1:n+1
            a(i,j) = a(i,j) - a(k,j)*a(i,k)/a(k,k)
        end;
        for j=1:k        // no hace falta para calcular la solución x
            a(i,j) = 0;  // no hace falta para calcular la solución x
        end              // no hace falta para calcular la solución x
    end
end
// Sustitución regresiva
x(n) = a(n,n+1)/a(n,n)
for i = n-1:-1:1
    sumk = 0
    for k=i+1:n
        sumk = sumk + a(i,k)*x(k)
    end
    x(i) = (a(i,n+1)-sumk)/a(i,i)
end
endfunction


x = [0  .15     .31     .5      .6      .75];
y = [1  1.004   1.31    1.117   1.223   1.422];

[p1, e1] = minCuadrados(x,y,1)
[p2, e2] = minCuadrados(x,y,2)
[p3, e3] = minCuadrados(x,y,3)

disp("El polinomio de mínimos cuadrados de grado 1:")
disp(p1)
disp("Los errores de aproximaión:")
disp(e1)
disp("La suma de errores:")
disp(sum(abs(e1)))

disp("El polinomio de mínimos cuadrados de grado 2:")
disp(p2)
disp("El error de aproximaión:")
disp(e2)
disp("La suma de errores:")
disp(sum(abs(e2)))

disp("El polinomio de mínimos cuadrados de grado 3:")
disp(p3)
disp("El error de aproximaión:")
disp(e3)
disp("La suma de errores:")
disp(sum(abs(e3))) //norma 1 


// Dibujamos tres polinomios encontrados y los puntos dados 

rango = [-2:0.01:2]

plot(rango, horner(p1,rango), 'r')
plot(rango, horner(p2, rango), 'b')
plot(rango, horner(p3, rango), 'g')
scatter(x,y)


a = gca(); a.x_location = 'origin'; a.y_location = 'origin';
a.data_bounds = [-1 -0.5; 2 2]

h1 = legend('p1', 'p2', 'p3')

disp("Mirando los errores y la grafica, podemos concluir que la mejor aproximación es la de grado 3")
