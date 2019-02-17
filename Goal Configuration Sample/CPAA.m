clear all
close all
clc

fig=figure('Color','white');
set(fig,'Name','Trajectory'); set(fig,'DoubleBuffer','on','Tag','trajScope');
set(fig,'Renderer','painters'); hold('on');

%% LINKS LENGTHS

a2 = 0.425;   % Valor original negativo
a3 = 0.39225; % Valor original negativo
d5 = 0.09465; % Valor original positivo

%% OBSTACLE AND ROBOT CONFIGURATION

x_obj = 0.2;
y_obj = 0.4;

%% INVERSE KINEMATICS - FOR ELBOW UP AND DOWN

elbow =  -1; % -1 -> DOWN
[qf_min] = CinematicaInversa(a2, a3, d5, x_obj, y_obj, elbow);

elbow = 1; % 1 -> UP
[qf_max] = CinematicaInversa(a2, a3, d5, x_obj, y_obj, elbow);


%% FINAL COORDINATES FOR EACH JOINT GIVEN THE INVERSE KINEMATICS FOR ELBOW UP

[x_min,y_min] = CinematicaDireta(a2,a3,d5,qf_min);
[x_max,y_max] = CinematicaDireta(a2,a3,d5,qf_max);  

%% PLOT ROBOT MAXIMUM AND MINIMUM

plotRobot(x_min,y_min,'b')
plotRobot(x_max,y_max,'k')


%% GOAL CONFIGURATION

n = abs(qf_max(1) - qf_min(1))/10;
interval = qf_min(1):n:qf_max(1) % Angle interval between each position in Goal Configuration 
goalConfig(x_obj,y_obj,a2,a3,d5,interval); % Goal Configuration Sample

xlabel('X (m)');
ylabel('Y (m)');
title('Goal Configuration Sample');
axis('square')
grid on