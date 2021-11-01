// 

function x = RegulaFalsi(f,a,b)
    eps = 0.0000001
    c = b - f(b)*(b-a)/(f(b)-f(a))
    while f(c) > eps
        if(f(a)*f(c) < 0) then
            b = c
        else
            a = c
        c = b - f(b)*(b-a)/(f(b)-f(a))
        end
    end
    x = c
endfunction
