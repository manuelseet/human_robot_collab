
%%%%%%%%%%%%%%%%%Robot Turn%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    %CorrFreeze;


%EEG marker MOVE (to side)
disp(sprintf('Puzzle %d Turn %d : (5) Robot Correct MOVE', i, num2str(turnNo)));
    %CorrMove


%EEG marker Error LAND
disp(sprintf('Puzzle %d Turn %d : (6) Robot Correct LAND', i, num2str(turnNo)));
    %CorrLand


%EEG marker Error RELEASE
disp(sprintf('Puzzle %d Turn %d : (10) Robot Correct RELEASE', i, num2str(turnNo)));
    %CorrRel
    
%EEG Marker END MOVING
disp(sprintf('Puzzle %d Turn %d : (11) Robot END MOVING', i, num2str(turnNo)));
    %RTurnEnd

Current_score = Current_score + 2 ;
added_score = 2;
score_now_msgbox(added_score,Current_score);

robot_end()
