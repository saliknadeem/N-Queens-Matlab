# N-Queens-Matlab
% A Genetic Algorithm implementation for the N-Queens problem

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
