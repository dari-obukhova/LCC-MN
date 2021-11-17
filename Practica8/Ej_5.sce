clear 

// Ejercicio 5 

// La Regla del Trapecio extendida 
// para calcular la integral de una función f(x,y)
// en un dominio bidimensional 

function w = trapecio_ext(f,a,b,c,d)
    h = (b-a) * (d-c) / 4
    w = h * (f(c,a) + f(c,b) + f(d,a) + f(d,b))
endfunction

deff('z=f(x,y)', 'z=sin(x+y)')

w = trapecio_ext(f,0,2,0,1)

disp(w)

// La Regla del Trapecio extendida compuesta

// Input: 
// f - la función 
// a, b - extremos de integración para 'y'
// d, c - extremos de integración para 'x'
// n - cantidad de subintervalos

// Output: 
// w - aproximación de la integral de f(x,y) por el método compuesto extendido de trapecio 


function w = trapecio_ext_compuesto(f,a,b,c,d,n)
    h1 = (b-a)/n
    h2 = (d-c)/n
    w = (1/2) * trapecio_auxiliar(f,d,c,a,n) + (1/2) * trapecio_auxiliar(f,d,c,b,n)
    for i=1:n-1
        x_i = a + i * h1 
        w = w + trapecio_auxiliar(f,d,c,x_i,n)
    end
    w = w * (h1*h2)
endfunction

// función auxiliar para el método extendido de trapecio 

// Input: 
// f - la función 
// d, c - extremos de integración para 'x'
// y - y fijo en f(x,y)
// n - cantidad de intervalos


function w = trapecio_auxiliar(f, d, c, y, n)
    h = (d-c)/n
    w = (1/2) * f(d,y) + (1/2) * f(c,y)
    for i=1:n-1
        x_i = c + i*h
        w = w + f(x_i,y)
    end
endfunction

w2 = trapecio_ext_compuesto(f,0,2,0,1,2)
disp(w2)
