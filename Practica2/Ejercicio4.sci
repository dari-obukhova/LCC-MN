clear

// Entrada: 
// f - ley de la función dada por un string 
// x - variable
// v - valor donde se evalua la derivada
// n - orden de derivación
// h - el paso de derivación
// Salida:
// Derivada n-esima evaluada en v

// Usando cociente incremental

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

// Usando numderivative

function valor = derivadaNum(f,v,n,h)
    deff("y = DF0(x)", "y="+f);
    if n==0 then valor = DF0(v);
    else
        for i = 1:(n-1)
        deff("y=DF"+string(i)+"(x)","y=numderivative(DF" + string(i-1)+",x," + string(h)+",4)");
        end
        deff("y=DFn(x)","y=numderivative(DF" + string(n-1)+",x," + string(h)+",4)");
        valor = DFn(v);
    end
endfunction

// Ejemplo de prueba

// p(x) = x⁴+5x³+8x

n = 7
orden = 2
h = 0.0001

answer = 798

valor1 = derivada("x^4+5*x^3+8*x",n,orden,h)
valor2 = derivadaNum("x^4+5*x^3+8*x",n,orden,h)

error_relativo_cociente_incr = abs(valor1 - answer) / answer
error_relativo_numderivative = abs(valor2 - answer) / answer

printf("derivada de p(x) = x⁴+5x³+8x de orden %d evaluada en %d con h = %d \n usando cociente incremental: %f \n", orden, n, h, valor1);
printf("derivada de p(x) = x⁴+5x³+8x de orden %d evaluada en %d con h = %d \n usando numderivative: %f \n", orden, n, h, valor2);
printf("respuesta correcta: %d \n", answer)
printf("error relativo (cociente incremental): %f \n", error_relativo_cociente_incr)
printf("error relativo (numderivative): %f \n", error_relativo_numderivative)
