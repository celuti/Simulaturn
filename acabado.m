function [ ] = acabado( pasadas,n,param,geom )
%ACABADO Pasada final de acabado
% el portaherramientas retorna al origen pasando por el contorno
% resultado de las operaciones de desbaste, y lleva a cabo una trayectoria
% final con la profundidad de pasada de acabado.

tramos = geom.tramos;

% Acabado previo:
% la herramienta recorre la trayectoria a la profundida de desbaste
% (todavia no esta haciendo la pasada de acabado) y vuelve al origen
for p=2:length(tramos(:,1))
    xini=tramos(p-1,2);
    xfin=tramos(p,2);
    yini=tramos(p-1,4);
    yfin=tramos(p,4);
    intervalos = 4*max(abs(xfin-xini),abs(yfin-yini));
    
    pasox=(xfin-xini)/intervalos;
    pasoy=(yfin-yini)/intervalos;
    for i=1:intervalos
        x=xini+i*pasox; y=yini+i*pasoy;
        plot(x,y,'or','MarkerSize',5,'MarkerFaceColor','r')
        axis([-5 5+max(tramos(1,3),tramos(end,2)) -5 5+max(tramos(1,3),tramos(end,2))])
        line([xini,x],[yini,y])
        for k=1:n
            line([pasadas(k,1),pasadas(k,2)],[pasadas(k,3),pasadas(k,4)],'Color',[.8 .8 .8])
        end
        monitorizar=calculos(param,geom,y,2);
        pieza(geom,monitorizar);
        pause(0.00000001)
    end
end %for tramos

% Vuelta al origen

xini=x;
xfin=0;
yini=y;
yfin=0;
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
    monitorizar=calculos(param,geom,y,2);
    pieza(geom,monitorizar);
    pause(0.00000001)
end

% Ahora SI comienza el ACABADO

% Penetracion acabado

xini=x;
yini=y;
yfin=tramos(1,3);
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
    monitorizar=calculos(param,geom,y,2);
    pieza(geom,monitorizar);
    pause(0.00000001)
end

% ACABADO

for p=1:length(tramos(:,1))
    xini=tramos(p,1);
    xfin=tramos(p,2);
    yini=tramos(p,3);
    yfin=tramos(p,4);
    intervalos = 4*max(abs(xfin-xini),abs(yfin-yini));
    
    pasox=(xfin-xini)/intervalos;
    pasoy=(yfin-yini)/intervalos;
    for i=1:intervalos
        x=xini+i*pasox; y=yini+i*pasoy;
        plot(x,y,'or','MarkerSize',5,'MarkerFaceColor','r')
        axis([-5 5+max(tramos(1,3),tramos(end,2)) -5 5+max(tramos(1,3),tramos(end,2))])
        line([xini,x],[yini,y])
        for k=1:n
            line([pasadas(k,1),pasadas(k,2)],[pasadas(k,3),pasadas(k,4)],'Color',[.8 .8 .8])
        end
        if p>1
            for l=1:p-1
                line([tramos(l,1),tramos(l,2)],[tramos(l,3),tramos(l,4)],'Color','m')
            end
        end
        monitorizar=calculos(param,geom,y,2);
        pieza(geom,monitorizar);
        pause(0.00000001)
    end
    
end % mecaniza



