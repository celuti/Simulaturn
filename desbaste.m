function [ ] = desbaste( pasadas,n,param,geom )
%DESBASTE Lleva a cabo las pasadas y las representa
%   Se producen los movimientos de avance y penetracion
%   del portaherramientas. Tambien los movimientos de aproximacion.
%   Se pasan por argumento las coordenadas de todas las pasadas y
%   el indice de la pasada correspondiente. Asi se pueden dibujar las
%   pasadas antiguas en gris.
tramos = geom.tramos;
xini=pasadas(n,1);
xfin=pasadas(n,2);
yini=pasadas(n,3);
yfin=pasadas(n,4);

% se divide la pasada en intervalos en relacion al eje que varia mas
intervalos = 2*max(abs(xfin-xini),abs(yfin-yini));
pasox=(xfin-xini)/intervalos;
pasoy=(yfin-yini)/intervalos;

% PASADAS DE DESBASTE
for i=1:intervalos
    x=xini+i*pasox; y=yini+i*pasoy;
    plot(x,y,'or','MarkerSize',5,'MarkerFaceColor','r')
    %     title('hola') % aqui se iran sacando por la ventana los parametros
    axis([-5 5+max(tramos(1,3),tramos(end,2)) -5 5+max(tramos(1,3),tramos(end,2))])
    line([xini,x],[yini,y])
    
    if n>1
        for k=1:(n-1)
            line([pasadas(k,1),pasadas(k,2)],[pasadas(k,3),pasadas(k,4)],'Color',[.8 .8 .8])
        end
    end
    monitorizar=calculos(param,geom,y,1);
    pieza(geom,monitorizar);
    pause(0.00000001)    
end

% Si no es la ultima pasada de desbaste la herramienta retrocede hacia
% el origen en X de las pasadas y a continuacion penetra "d" mm
if n<length(pasadas(:,1)) % es la ultima pasada?
    
    % Retroceso
    
    xini=x;
    xfin=0;
    yini=y;
    yfin=y-param.desbaste.d/2;
    intervalos = max(abs(xfin-xini),abs(yfin-yini));
    
    pasox=(xfin-xini)/intervalos;
    pasoy=(yfin-yini)/intervalos;
    for i=1:intervalos
        x=xini+i*pasox; y=yini+i*pasoy;
        plot(x,y,'or','MarkerSize',5,'MarkerFaceColor','r')
        axis([-5 5+max(tramos(1,3),tramos(end,2)) -5 5+max(tramos(1,3),tramos(end,2))])
        line([xini,x],[yini,y],'Color','g')
        for k=1:n
            line([pasadas(k,1),pasadas(k,2)],[pasadas(k,3),pasadas(k,4)],'Color',[.8 .8 .8])
        end
        monitorizar=calculos(param,geom,yini,1);
        pieza(geom,monitorizar);
        pause(0.00000001)
    end
    
    
    % Penetracion
    
    xini=x;
    yini=y;
    yfin=y+1.5*param.desbaste.d;
    intervalos = 4*abs(yfin-yini);
    
    pasoy=(yfin-yini)/intervalos;
    for i=1:intervalos
        y=yini+i*pasoy;
        plot(x,y,'or','MarkerSize',5,'MarkerFaceColor','r')
        axis([-5 5+max(tramos(1,3),tramos(end,2)) -5 5+max(tramos(1,3),tramos(end,2))])
        line([xini,x],[yini,y])
        for k=1:n
            line([pasadas(k,1),pasadas(k,2)],[pasadas(k,3),pasadas(k,4)],'Color',[.8 .8 .8])
        end
        monitorizar=calculos(param,geom,yini,1);
        pieza(geom,monitorizar);
        pause(0.00000001)
    end
    
end %if: es la ultima pasada?

end % desbaste



