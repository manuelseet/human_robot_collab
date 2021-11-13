
robot_start()

%EEG marker START MOVING
disp(sprintf('Puzzle %d Turn %d : (1) Robot Start Moving', i, num2str(turnNo)));
    %RTurnStart;


%EEG marker PICKING UP BLOCK
disp(sprintf('Puzzle %d Turn %d : (2) Robot Grasping Block', i, num2str(turnNo)));
    %PreGrasp;


%EEG marker CARRYING BLOCK
disp(sprintf('Puzzle %d Turn %d : (3) Robot Carrying Block', i, num2str(turnNo)));
    %PreLift;


%EEG marker HOLDING
disp(sprintf('Puzzle %d Turn %d : (4) Robot HOLDING', i, num2str(turnNo)));
    %RcvFreeze;


%EEG marker MOVE (to side)
disp(sprintf('Puzzle %d Turn %d : (5) Robot Error MOVE', i, num2str(turnNo)));
    %RcvErrMove


%EEG marker Error LAND
disp(sprintf('Puzzle %d Turn %d : (6) Robot Error LAND', i, num2str(turnNo)));
    %RcvErrLand

%%%%%APOLOGY%%%%%%%%%%%%%%%%
%create apology label
apoLabel = strcat(apoLab,mp3);

%Play APOLOGY
disp(sprintf('Puzzle %d Turn %d : (7) Robot APOLOGY', i, num2str(turnNo)));
[y,Fs] = audioread(apoLabel);
sound(y,Fs); %RcvApolOn   %EEG Marker here
pause(8); %RcvApolOff     %EEG Marker here

%%%%%%APOLOGY END%%%%%%%%%%%%%%

%EEG marker Error Carry
disp(sprintf('Puzzle %d Turn %d : (8) Robot Error LIFT', i, num2str(turnNo)));
    %RcvCorrLift


%EEG marker CORRECT LAND
disp(sprintf('Puzzle %d Turn %d : (9) Robot Correct LAND', i, num2str(turnNo)));
    %RcvCorrLand

%EEG marker CORRECT RELEASE
disp(sprintf('Puzzle %d Turn %d : (10) Robot Correct RELEASE', i, num2str(turnNo)));
    %RcvCorrRel
    
%EEG Marker END MOVING
disp(sprintf('Puzzle %d Turn %d : (11) Robot END MOVING', i, num2str(turnNo)));
    %RTurnEnd

Current_score = Current_score + 2 ;
added_score = 2;
score_now_msgbox(added_score,Current_score);

robot_end()
