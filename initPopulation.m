function [population, badPopulation] = initPopulation(NQueens,populationSize)
    badPopSize = floor(sqrt(populationSize));
    totalPopulation = zeros(populationSize+badPopSize,NQueens);
 
    
    template = [1:NQueens];
    for i=1:populationSize+badPopSize
        totalPopulation(i,:) = template(randperm(length(template)));
    end
    
    fitness = checkFitness(totalPopulation);
    sortedPop = sortPopulation(totalPopulation, fitness);
    
    population = sortedPop(1:populationSize,:);
    badPopulation = sortedPop(populationSize:populationSize+badPopSize,:);
    
end