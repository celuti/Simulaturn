function [ ] = pieza( geom,monitorizar )
%PIEZA Representacion de la pieza acabada
%   Se corresponde con el plano de especificaciones de la pieza
tramos = geom.tramos;
dimensiones = geom.dimensiones;
axis([-5 5+max(dimensiones) -5 5+max(dimensiones)])
for l=1:length(tramos(:,1))
    line([tramos(l,1),tramos(l,2)],[tramos(l,3),tramos(l,4)],'Color','k')
    line([tramos(l,1),tramos(l,2)],[dimensiones(1)-tramos(l,3),dimensiones(1)-tramos(l,4)],'Color','k')
end
line([0,dimensiones(2)],[dimensiones(1)/2,dimensiones(1)/2],'Color','c','LineStyle','-.')
line([tramos(end,2),dimensiones(2)],[0,0],'Color','k')
line([tramos(end,2),dimensiones(2)],[dimensiones(1),dimensiones(1)],'Color','k')
line([0,0],[tramos(1,3),dimensiones(1)-tramos(1,3)],'Color','k')
line([dimensiones(2),dimensiones(2)],[0,dimensiones(1)],'Color','k')
% D N V f a t L estado

titulo=sprintf('D:%4.02f  N:%6.00f  V:%6.02f  f:%6.02f  a:%6.02f  t:%6.02f  L:%6.02f  Estado:%6.00f',monitorizar(1),monitorizar(2),monitorizar(3),monitorizar(4),monitorizar(5),monitorizar(6),monitorizar(7),monitorizar(8));

title(titulo) % aqui se iran sacando por la ventana los parametros
end
