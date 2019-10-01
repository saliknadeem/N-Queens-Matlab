function [sortedPop] = sortPopulation(population, fitness)
    
    for i=1:length(fitness)
    fitnessWithIndex(i,:) = [i fitness(i)];
    end
    sortedFitness = sortrows(fitnessWithIndex,2);
    
    sortedPop = population;
    
    for i = 1:length(population(:,1))
        sortedPop(i,:) = population(sortedFitness(i,1),:);
    end
    
    
end
    
    