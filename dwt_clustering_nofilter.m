%% Start with clean slate
clear all; close all; clc; imtool close all;
set(0, 'DefaultFigureWindowStyle','docked');

%% Read in Image
he = imread('tiff_images/ID_0000_AGE_0060_CONTRAST_1_CT.tif');

%% DWT
[LL, LH, HL, HH] = dwt2(he, 'db1');

%% K-means clustering
I = im2double(HH);
c = kmeans(I(:), 25);

%% reshape
p = reshape(c, size(I));

%% Output
%disp(p);

%% Back to image
image = mat2gray(p);
imshow(image);
