%Generating EEG Shapes for the Onlien task


% Clear the workspace and the screen
sca;
close all;
clearvars;
Screen('Preference', 'SkipSyncTests', 1);

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;
inc = white - grey;

% Open an on screen window
[window, windowRect] = Screen('OpenWindow', screenNumber, white);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% 

% display robot_picture
picture_file = imread(a);                                       %x = name of file
resized_pic = imresize(picture_file, b);                        %y = resizing proportion (e.g. 0.5) 
picture_filedisp = Screen('MakeTexture', window, resized_pic);  
Screen('DrawTexture', window, picture_filedisp, [], [], 0);     % c = source, d = picture   


Screen('Flip', window);
pause(3);


% Flip to the screen
Screen('Flip', window);

% Wait for key press
KbStrokeWait;

% Clear the screen
sca;



%{
imread('Tan6.png');
imshow('Tan6.png');
set(gcf,'color','w');

%rectangle('position',[0.5 0.5 0.05 0.05], 'EdgeColor', 'r','LineWidth', 3,'LineStyle',':');

%}