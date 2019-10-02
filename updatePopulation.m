function [population] = updatePopulation(population, badPopulation, probMutation, probCrossOver)
    NQueens = size(population,2);
    populationSize = size(population,1);
    
    randNumbers = randperm(populationSize);
    
    parentA = population(randNumbers(1),:);
    parentB = population(randNumbers(2),:);

%     if ( probCrossOver >= rand() )
% %             fprintf('crossover happened');
%         k1 = floor(NQueens*rand()+1); % cut from k1
%         k2 = floor(NQueens*rand()+1); % cut till k2
%         if k1>k2
%             temp = k1; k1=k2;k2=temp;
%         end
%         tempChildA = zeros(1, NQueens);
%         tempChildA(k1:k2)=parentA(k1:k2); % put parent A values from k1-k2 in the child
%         parentAremaining = population(randNumbers(2),(~ismember(population(randNumbers(2),:), parentA(k1:k2))));
%         I = find(tempChildA == 0 );
%         tempChildA(I) = parentAremaining;
% 
%         tempChildB = zeros(1, NQueens);
%         tempChildB(k1:k2)=parentB(k1:k2); % put parent A values from k1-k2 in the child
%         parentBremaining = population(randNumbers(1),(~ismember(population(randNumbers(1),:), parentB(k1:k2))));
%         I = find(tempChildB == 0 );
%         tempChildB(I) = parentBremaining;
%     else
%         tempChildA = parentA;
%         tempChildB = parentB;
%     end
% 
%     if ( probMutation >= rand() )
% %             fprintf('mutation happened');
%         k1 = floor(NQueens*rand()+1); % random alele k1
%         k2 = floor(NQueens*rand()+1); % random alele k2
%         tempAlele = parentA(k1);parentA(k1) = parentA(k2); parentA(k2) = tempAlele;
%         k1 = floor(NQueens*rand()+1); % random alele k1
%         k2 = floor(NQueens*rand()+1); % random alele k2
%         tempAlele = parentB(k1);parentB(k1) = parentB(k2); parentB(k2) = tempAlele;
%     end    
%     if ( probMutation >= rand() )
% %             fprintf('mutation happened');
%         k1 = floor(NQueens*rand()+1); % random alele k1
%         k2 = floor(NQueens*rand()+1); % random alele k2
%         tempAlele = tempChildA(k1);tempChildA(k1) = tempChildA(k2); tempChildA(k2) = tempAlele;
%         k1 = floor(NQueens*rand()+1); % random alele k1
%         k2 = floor(NQueens*rand()+1); % random alele k2
%         tempAlele = tempChildB(k1);tempChildB(k1) = tempChildB(k2); tempChildB(k2) = tempAlele;
% 
%     end  


    [childA, childB] = geneticOperations(parentA, parentB, probMutation, probCrossOver);
    
    fitnessNewGen = checkFitness([parentA;parentB;childA;childB]);
    if fitnessNewGen(1) < fitnessNewGen(3)
        childA = parentA;
    end
    if fitnessNewGen(2) < fitnessNewGen(4)
        childB = parentB;
    end
    population(randNumbers(1),:) = childA;
    population(randNumbers(2),:) = childB;
    
%     fitnessNewGen = checkFitness([parentA;parentB;tempChildA;tempChildB]);
%     if fitnessNewGen(1) > fitnessNewGen(3)
%         population(randNumbers(1),:) = tempChildA;
%     end
%     if fitnessNewGen(2) > fitnessNewGen(4)
%         population(randNumbers(2),:) = tempChildB;
%     end


    if (length(badPopulation(:,1)) >= 2)
        randNumbers = randperm(size(badPopulation,1));
        parentA = badPopulation(randNumbers(1),:);
        parentB = badPopulation(randNumbers(2),:);
        [childABad, childBBad] = geneticOperations(parentA, parentB, probMutation, probCrossOver);
    end

    
    newPop = [population; childABad; childBBad];
    fitness = checkFitness(newPop);
    newPop = sortPopulation(newPop, fitness);        
    population = newPop(1:populationSize,:);

end
