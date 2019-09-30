function [population] = updatePopulation(population, probMutation, probCrossOver)
    NQueens = size(population,2);
    populationSize = size(population,1);

    
    if mod(populationSize,2) == 0
        sizePop = populationSize;
    else
        sizePop = populationSize-1;
    end
    
    randomizeParents = randperm(sizePop);
    
    for i=1:2:sizePop
        parentA = population(randomizeParents(i),:);
        parentB = population(randomizeParents(i+1),:);
        if ( probCrossOver >= rand() )
%             fprintf('crossover happened');
            k1 = floor(NQueens*rand()+1); % cut from k1
            k2 = floor(NQueens*rand()+1); % cut till k2
            if k1>k2
                temp = k1; k1=k2;k2=temp;
            end
            tempChildA = zeros(1, NQueens);
            tempChildA(k1:k2)=parentA(k1:k2); % put parent A values from k1-k2 in the child
            parentAremaining = population(randomizeParents(i+1),(~ismember(population(randomizeParents(i+1),:), parentA(k1:k2))));
            I = find(tempChildA == 0 );
            tempChildA(I) = parentAremaining;
            
            tempChildB = zeros(1, NQueens);
            tempChildB(k1:k2)=parentB(k1:k2); % put parent A values from k1-k2 in the child
            parentBremaining = population(randomizeParents(i),(~ismember(population(randomizeParents(i),:), parentB(k1:k2))));
            I = find(tempChildB == 0 );
            tempChildB(I) = parentBremaining;
        else
            tempChildA = parentA;
            tempChildB = parentB;
        end

        if ( probMutation >= rand() )
%             fprintf('mutation happened');
            k1 = floor(NQueens*rand()+1); % random alele k1
            k2 = floor(NQueens*rand()+1); % random alele k2
            tempAlele = parentA(k1);parentA(k1) = parentA(k2); parentA(k2) = tempAlele;
            k1 = floor(NQueens*rand()+1); % random alele k1
            k2 = floor(NQueens*rand()+1); % random alele k2
            tempAlele = parentB(k1);parentB(k1) = parentB(k2); parentB(k2) = tempAlele;
        end    
        if ( probMutation >= rand() )
%             fprintf('mutation happened');
            k1 = floor(NQueens*rand()+1); % random alele k1
            k2 = floor(NQueens*rand()+1); % random alele k2
            tempAlele = tempChildA(k1);tempChildA(k1) = tempChildA(k2); tempChildA(k2) = tempAlele;
            k1 = floor(NQueens*rand()+1); % random alele k1
            k2 = floor(NQueens*rand()+1); % random alele k2
            tempAlele = tempChildB(k1);tempChildB(k1) = tempChildB(k2); tempChildB(k2) = tempAlele;
            
        end  
        
        fitnessNewGen = checkFitness([parentA;parentB;tempChildA;tempChildB]);
        if fitnessNewGen(1) > fitnessNewGen(3)
            population(randomizeParents(i),:) = tempChildA;
        end
        if fitnessNewGen(2) > fitnessNewGen(4)
            population(randomizeParents(i+1),:) = tempChildB;
        end
    end
    
end
