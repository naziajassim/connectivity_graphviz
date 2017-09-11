% Nazia Jassim, 14.05.2017

% Generate graphviz input files
% copies contents of header.dot 
% graphviz command "dot" should be manually called 
% from windows or linux command line to generate image
%
% Function call sequence: undirected => write_dot => line_thickness
%
clear;
load connectivity_weights.mat

% Plot graph for different contrasts
              
write_dot (connectivity_weights, 'contrast_graph_')

clear all;