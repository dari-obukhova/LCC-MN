clear 

//Ej 1
//La función que resuelve un sistema triangular superior

//Input: 
//A - matriz de coeficientes
//b - un vector

function x = upper_triangular(A, b)
    n = size(A,1)
    x(n) = b(n)/A(n,n)
    for i = n-1:-1:1
        x(i) = ( b(i) - A(i, i+1:n)*x(i+1:n) ) / A(i,i)
    end
endfunction

//Ejemplos
A1 = [1,2,1; 0,-2,1; 0,0,0.5]
b1 = [0,3,0.5]'
ans1 = [1,-1,1]'
printf("raices de A1*x=b1: ")
disp(ans1)
printf("raices de A1*x=b1, calculados con la función ''upper_triangular'':")
disp(upper_triangular(A1,b1))

A2 = [2,4,-2; 0,-10,10; 0,0,-8]
b2 = [-10,40,-16]'
ans2 = [1,-2,2]'
printf("raices de A2*x=b2: ")
disp(ans2)
printf("raices de A2*x=b2, calculados con la función ''upper_triangular'':")
disp(upper_triangular(A2,b2))

//La función que resuelve un sistema triangular inferior 

//Input: 
//A - matriz de coeficientes
//b - un vector

function x = lower_triangular(A, b)
    n = size(A,1)
    x(1) = b(1)/A(1,1)
    for i = 2:n
        x(i) = ( b(i) - A(i, 1:i-1)*x(1:i-1) ) / A(i,i)
    end
endfunction

//Ejemplos
A3 = [1,0,0; 4,5,0; 7,8,9]
b3 = [7,21,8]'
ans3 = [7,-1.4,-3.311]'
printf("raices de A3*x=b3: ")
disp(ans3)
printf("raices de A3*x=b3, calculados con la función ''lower_triangular'':")
disp(lower_triangular(A3,b3))

A4 = [1,0,0; 2,3,0; 4,2,5]
b4 = [2,-2,10]'
ans4 = [2,-2,1.2]'
printf("raices de A4*x=b4: ")
disp(ans4)
printf("raices de A4*x=b4, calculados con la función ''lower_triangular'':")
disp(lower_triangular(A4,b4))
