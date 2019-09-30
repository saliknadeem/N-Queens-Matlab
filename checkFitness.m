function [fitness] = checkFitness(population)
    NQueens = size(population,2);
    populationSize = size(population,1);

%     grid = zeros(NQueens,NQueens);
%     rows=[];
%     cols=[];
%     for x=1:NQueens
%         rows = [rows x];
%         cols = [cols population(1,x)];
%         grid(x,population(1,x)) = 1;
%     end
 
    
%     for i=1:populationSize
%         fitScore = 0;
%         for x=1:NQueens-1
%             for y=x:NQueens-1
%                 if grid(x,y) == 1
%                     if ( grid(x,y) == grid(x+1,y+1) )
%                         fitScore = fitScore + 1;
%                     end
%                     if ( population(i,x) == population(i,y)- y )
%                         fitScore = fitScore + 1;
%                     end
%                 end
%             end
%         end
%         fitness(i) = fitScore;
%     end
    
    
    
    for i=1:populationSize
        fitScore = 0;
%         sprintf("------ start population=%d",i)
        for x1=1:NQueens-1
            for x2=x1+1:NQueens
               if ( population(i,x1) == population(i,x2)+(x2-x1) ) % Compare the / diagonal entries below 
%                    sprintf("x1=%d, x2=%d, val@x1=%d",x1,x2,population(i,x1))
                   fitScore = fitScore + 1;
               end
               if ( population(i,x1) == population(i,x2)-(x2-x1) ) % Compare the \ diagonal entries below 
                   fitScore = fitScore + 1;
%                    sprintf("x1=%d, x2=%d, val@x1=%d",x1,x2,population(i,x1))
               end
            end
        end
        fitness(i) = fitScore;
    end

end