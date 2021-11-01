clear 

function circ(r,x,y)
//    plot2d(0,0,-1,"031"," ",[x-r,y-r,2*r,2*r])
    xarc(x-r,y+r, 2*r, 2*r, 0, 360*64)
endfunction


// La función que dibuja los circulos de Gershgorin 
// y autovalores de una matriz A 

function gres(A)
    [n,m] = size(A);
    centros = diag(A);
    radios = sum(abs(A), 'c') - abs(centros);  //opción 'c' --> sumar por filas 
    
    // buscamos calcular un rectangulo que contenga a todos los circulos 
    
    // esquina inferior izquierda 
    mx = round(min(centros - radios) - 1) // punto más a la izquierda - 1
    my = round(min(-radios) - 1) 
    
    // esquina superior derecha
    Mx = round(max(centros+radios)+1)
    My = round(max(radios) +1)
    
    rectangulo = [mx, my, Mx, My]
    
    autovalores = spec(A)
    plot2d(real(autovalores),imag(autovalores),-1,"031","", rectangulo)
    
    xgrid();
    
    for i = 1:n
        circ(radios(i), centros(i),0)
    end
    
endfunction

//A = [4 -1 0; -1 4 -1; -1 -1 4]
