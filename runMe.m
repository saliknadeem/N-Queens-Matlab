%% Implementation of a very basic Genetic Algorithm to solve the N-Queens problem
%   
%   Solution by Salik Nadeem
%   ------------------------
%   
%   Algorithm was inspired by this paper:
%   https://arxiv.org/ftp/arxiv/papers/1802/1802.02006.pdf
%   Followed most of the steps explained in the paper
%
%
%   Functions used:
%   1- initPopulation.m - this takes the parameters N and size to
%   generate a population
%   2- checkFitness.m - takes population variable as input and calculates
%   the fitness of each chromosome
%   3- updatePopulation.m - this performs the mating, generating 2 child
%   per pair of parents and implements crossover and mutation of the
%   chromosoes and replaces the parents with the children if they are more
%   fit
%   4- displayBoard.m - a nice funtion to visualize the result of a
%   chromosome
%


close;clear;

%% Main parameters
NQueens = 8;
epochs = 500;
populationSize = 10;
probMutation = 0.15;
probCrossOver = 0.75;

%% Running the experiments

[population, badPop] = initPopulation(NQueens,populationSize);
fprintf('------initial fitness------')
fitness = checkFitness(population)

for evolve=1:epochs
population = updatePopulation(population, probMutation, probCrossOver);
fitness = checkFitness(population);
I = find(fitness == 0);
if size(I,2) == populationSize
    sprintf('all converged at epoch=%d',evolve)
    break;
end

end


fprintf('------final fitness------')
fitness = checkFitness(population)

I = find(fitness == 0);
if size(I,2) > 0
    displayBoard(NQueens,population(I(1),:));
elseif size(I,2) == 0
    fprintf('didnt find a solution with no conflicts\n');
end


