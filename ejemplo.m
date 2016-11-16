clear, clc, close all

%---------------------------------------------
%  G E O M E T R I A
%---------------------------------------------
geom.dimensiones = [60,100];
% xini,xfin yini,yfin tipo=1:cilindrado,2:conico/refrentado,3:radio(TODO)
geom.tramos=...
    [[0,34,10.5,10.5,1];...
    [34,40,10.5,4,2];...
    [40,40,4,0,2]];
Results.data=[];
%---------------------------------------------
%  D E S B A S T E
%---------------------------------------------
param.desbaste.corte_tipo=1; % 1=V(m/min), 2=N(rpm)
param.desbaste.V=200;
param.desbaste.d=1; % produnfidad de pasada en mm
param.desbaste.avance_tipo=2; %1=f(mm/min), 2=a(mm/rev)
param.desbaste.a=0.2;
param.desbaste.vmax=800;
param.desbaste.Nmax=2500;

%---------------------------------------------
%  A C A B A D O
%---------------------------------------------
param.acabado.corte_tipo=1; % 1=V(m/min), 2=N(rpm)
param.acabado.V=225;
param.acabado.d=0.5; % produnfidad de pasada en mm
param.acabado.avance_tipo=1; %1=f(mm/min), 2=a(mm/rev)
param.acabado.f=80;
param.acabado.f=param.desbaste.vmax;
param.acabado.Nmax=param.desbaste.Nmax;

Results=simulaturn(geom,param,Results);

