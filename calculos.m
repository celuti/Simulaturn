function [ resultados ] = calculos( param,geom,y,operacion )
%CALCULOS Calcula los parametros de corte
%   D: dimatro (m)
%   N: velocidad de giro del husillo (rpm)
%   V: velocidad de corte (m/min)
%   f: avance (mm/min)
%   a: avance (mm/rev)
%   0: tiempo de pasada TODO
%   0: TODO

D = geom.dimensiones(1)-2*y;
if operacion==1
    if param.desbaste.corte_tipo==1
        V = param.desbaste.V;
        N = V/(pi*D*0.001);
    elseif param.desbaste.corte_tipo==2
        N = param.desbaste.N;
        V = N*(pi*D*0.001);
    end
    if param.desbaste.avance_tipo==1
        f = param.desbaste.f;
        a=f/N;
    elseif param.desbaste.avance_tipo==2
        a = param.desbaste.a;
        f = a*N;
    end
elseif operacion==2
    if param.acabado.corte_tipo==1
        V = param.acabado.V;
        N = V/(pi*D*0.001);
    elseif param.acabado.corte_tipo==2
        N = param.acabado.N;
        V = N*(pi*D*0.001);
    end
    if param.acabado.avance_tipo==1
        f = param.acabado.f;
        a=f/N;
    elseif param.acabado.avance_tipo==2
        a = param.acabado.a;
        f = a*N;
    end    
end
resultados=[D,N,V,f,a,0,0];
end

