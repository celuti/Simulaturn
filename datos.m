function [Results] = datos(mov_dat,Results)

 ResultsSize=size(Results.data,1);
        for i=1:8
             Results.data(ResultsSize+1,i)=mov_dat(i);   %Guarda en al ultima posicion de Results los datos de movimiento 
        end