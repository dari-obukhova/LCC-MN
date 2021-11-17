clear 

function w = trapecio_compuesto(fx,a,b,n)
    h = (b-a)/n
    w = (fx(a)/2) + (fx(b)/2)
    for i = 1:n-1
        w = w + fx(a+i*h)
    end
    w = h*w
endfunction


// n - subdivisión para el intervalo [a,b]
// m - subdivisión para el intervalo [c,d]

function w = trapecio_doble(f,a,b,c,d,n,m)
    h = (b-a)/n
    deff("z=fxa(y)", "z=f("+string(a)+",y)")
    deff("z=fxb(y)", "z=f("+string(b)+",y)")
    w = (trapecio_compuesto(fxa, c(a),d(a),m)/2) + (trapecio_compuesto(fxb, c(b), d(b), m)/2)
    for i=1:n-1
        xi = a+i*h
        deff("z=fxi(y)", "z=f("+string(xi)+",y)")
        w = w + trapecio_compuesto(fxi,c(xi),d(xi),m)
    end
    w = h*w
endfunction



function w = simpson_compuesto(fx,a,b,n)
    h = (b-a)/n
    w = fx(a) + fx(b)
    for i = 1:(n-1)
        x_i = a + i*h
        if modulo(i,2)==0
            then w = w + 2*f(x_i)
        else  w = w + 4*f(x_i)
        end
    end
    w = h/3 * w 
endfunction

function w = simpson_doble(f,a,b,c,d,n,m)
    h = (b-a)/n
    deff("z=fxa(y)", "z=f("+string(a)+",y)")
    deff("z=fxb(y)", "z=f("+string(b)+",y)")
    w = simpson_compuesto(fxa, c(a), d(a),m) + simpson_compuesto(fxb, c(b), d(b), m)
    for i = 1:n-1
        x_i = a + i*h
        deff("z=fxi(y)", "z=f("+string(x_i)+",y)")
        if modulo(i,2)==0
            then w = w + 2*(simpson_compuesto(fxi, c(x_i), d(x_i),m))
        else  w = w + 4*(simpson_compuesto(fxi, c(x_i), d(x_i),m))
        end
    end
    w = h/3 * w
endfunction




function z = uno(x,y)
    z = 1
endfunction

function y = cx1(x)
    y = -sqrt(2*x-x^2)
endfunction

function y = dx1(x)
    y = sqrt(2*x-x^2)
endfunction

funcprot(0) // para no reproducir los warnings por redefinir fxi
w = trapecio_doble(uno,0,2,cx1,dx1,100,100)
disp(w)

w2 = simpson_doble(uno,0,2,cx1,dx1,100,100)
disp(w2)
