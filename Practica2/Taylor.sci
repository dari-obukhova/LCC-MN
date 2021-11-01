clear

function valor = derivada(f,v,n,h)
    deff("y = DF0(x)", "y="+f);
    if n==0 then valor = DF0(v);
    else
        for i = 1:(n-1)
        deff("y=DF"+string(i)+"(x)","y=(DF"+string(i-1)+"(x+"+string(h)+")-DF"+string(i-1)+"(x))/"+string(h));
        end
        deff("y=DFn(x)","y=(DF"+string(n-1)+"(x+"+string(h)+")-DF"+string(n-1)+"(x))/"+string(h));
        valor = DFn(v);
    end
endfunction

// Función que calcula el valor de un polinomio de Taylor 
// Entrada: 
// f - una función
// n - grado de polinomio
// a - el punto cerca cual evaluamos el polinomio  
// v - punto 
// Salida: 
// Valor aproximado de una función en un punto dado

h = 0.0001 //el paso de derivación

function valor = taylor(f, n, a, v, h)
    deff("y = g(x)", "y="+f);
    valor = g(a);
    for i = 1:n
        valor = valor + (derivada(f,a,i,h)*((v-a)^i))/(factorial(i));
    end
endfunction

// Ejemplo de prueba
// 
// Encontremos un valor aproximado de la función f(x) = cos(x) en un punto v = 0.1
// usando el polinomio de Taylor de grado n = 5 alrededor del punto a = 0 
//

f = 'sin(x)'
n = 5
a = 0
v = 0.5
t = taylor(f, n, a, v, h);

respuesta_correcta = 0.4794255386

error_relativo = abs(t - respuesta_correcta)/ respuesta_correcta

printf("valor de f(x) = %s en un punto %f : %f \n", f, v, respuesta_correcta);

printf("valor de f(x) = %s en un punto %f usando el polinomio de Taylor: %f \n", f, v, t);

printf("error relativo: %f", error_relativo)
