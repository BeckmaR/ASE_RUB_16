clc
clear all
close all

[y,fs] = audioread('13zz637a.wav');
configfile = 'configSPEC.con';

features = computeFeatures(y, fs, configfile);