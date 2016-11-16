function [ resultados ] = calculos( param,geom,y,operacion,lpasada,estado)
%CALCULOS Calcula los parametros de corte
%   D: dimatro (m)
%   N: velocidad de giro del husillo (rpm)
%   V: velocidad de corte (m/min)
%   f: avance (mm/min)
%   a: avance (mm/rev)
%   t: tiempo de pasada
%   0: TODO

D = geom.dimensiones(1)-2*y;
if operacion==1
    if param.desbaste.corte_tipo==1
        V = param.desbaste.V;
        N = V/(pi*D*0.001);
        if N>param.desbaste.Nmax
            N=param.desbaste.Nmax;
        end
        f=V;
    elseif param.desbaste.corte_tipo==2
        N = param.desbaste.N;
        if N>param.desbaste.Nmax
            N=param.desbaste.Nmax;
        end
        V = N*(pi*D*0.001);
        f=V;
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
        if N>param.desbaste.Nmax
         N=param.desbaste.Nmax;
        end
        f=V;
    elseif param.acabado.corte_tipo==2
        N = param.acabado.N;
        if N>param.desbaste.Nmax
          N=param.desbaste.Nmax;
        end
        V = N*(pi*D*0.001);
        f=V;
    end
    if param.acabado.avance_tipo==1
        f = param.acabado.f;
        a=f/N;
        
    elseif param.acabado.avance_tipo==2
        a = param.acabado.a;
        f = a*N;
        
    end    
end

if estado>=3 
    f=param.desbaste.vmax;
    t=lpasada/f;
else
    t=lpasada/f;
end

resultados=[D,N,V,f,a,t,lpasada,estado];
end



