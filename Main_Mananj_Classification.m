clc
clear
close all

se = strel('disk',5);
ax = input('What is your image types[1) JPG 2)PNG]: ');

remove(ax,se);
mananj(ax,se);