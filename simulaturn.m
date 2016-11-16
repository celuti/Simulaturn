function [Results]=simulaturn(geom,param,Results)
% SIMULATURN funcion principal que calcula las pasadas y llama a las funciones
% de desbaste y acabado
tramos = geom.tramos;
npasadas_desbaste=floor((tramos(1,3)-param.acabado.d)/param.desbaste.d);
pasadas = zeros(npasadas_desbaste,4);
j=length(tramos(:,1));
for i=1:npasadas_desbaste
    xini=tramos(1,1); yini=i*param.desbaste.d;
    % Se calcula la xfin en funcion de la altura yini: depende del tramo
    if yini<tramos(j,3)        
        xfin = tramos(j,1)+((tramos(j,2)-tramos(j,1))*(tramos(j,3)-yini)/(tramos(j,3)-tramos(j,4)));
    else
        j = j-1;
    end
    pasadas(i,:)=[xini,xfin,yini,yini];
    
    % Pasadas de desbaste

    Results=desbaste(pasadas,i,param,geom,Results);
    
end
% Pasadas finales de acabado

Results=acabado(pasadas,i,param,geom,Results); 
end