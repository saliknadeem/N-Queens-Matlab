function [population] = initPopulation(NQueens,populationSize)
population = [];
template = [1:NQueens];
    for i=1:populationSize
        population(i,:) = template(randperm(length(template)));
    end
end