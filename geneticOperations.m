function [childA, childB] = geneticOperations(parentA, parentB, probMutation, probCrossOver)
    NQueens = size(parentA,2);
    
    if ( probCrossOver >= rand() )
%             fprintf('crossover happened');
        k1 = floor(NQueens*rand()+1); % cut from k1
        k2 = floor(NQueens*rand()+1); % cut till k2
        if k1>k2
            temp = k1; k1=k2;k2=temp;
        end
        childA = zeros(1, NQueens);
        childA(k1:k2)=parentA(k1:k2); % put parent A values from k1-k2 in the child
        parentAremaining = parentB((~ismember(parentB(:), parentA(k1:k2))));
        I = find(childA == 0 );
        childA(I) = parentAremaining;

        childB = zeros(1, NQueens);
        childB(k1:k2)=parentB(k1:k2); % put parent A values from k1-k2 in the child
        parentBremaining = parentA((~ismember(parentA(:), parentB(k1:k2))));
        I = find(childB == 0 );
        childB(I) = parentBremaining;
    else
        childA = parentA;
        childB = parentB;
    end

%     if ( probMutation >= rand() )
% %             fprintf('mutation happened');
%         k1 = floor(NQueens*rand()+1); % random alele k1
%         k2 = floor(NQueens*rand()+1); % random alele k2
%         tempAlele = parentA(k1);parentA(k1) = parentA(k2); parentA(k2) = tempAlele;
%         k1 = floor(NQueens*rand()+1); % random alele k1
%         k2 = floor(NQueens*rand()+1); % random alele k2
%         tempAlele = parentB(k1);parentB(k1) = parentB(k2); parentB(k2) = tempAlele;
%     end    

    if ( probMutation >= rand() )
%             fprintf('mutation happened');
        k1 = floor(NQueens*rand()+1); % random alele k1
        k2 = floor(NQueens*rand()+1); % random alele k2
        tempAlele = childA(k1);childA(k1) = childA(k2); childA(k2) = tempAlele;
        k1 = floor(NQueens*rand()+1); % random alele k1
        k2 = floor(NQueens*rand()+1); % random alele k2
        tempAlele = childB(k1);childB(k1) = childB(k2); childB(k2) = tempAlele;

    end  

    
%     fitnessNewGen = checkFitness([parentA;parentB;childA;childB]);
%     if fitnessNewGen(1) < fitnessNewGen(3)
%         childA = parentA;
%     end
%     if fitnessNewGen(2) < fitnessNewGen(4)
%         childB = parentB;
%     end
    
    
end
