%Human robot set-up

%%Experimental parameters
NumCorrPuzz = 2;
NumErrPuzz = 2;
NumRecovPuzz = 2;

start_signal = '\n Puzzle %d. Experimenter, please enter <S> to start the puzzle';
puzz_starting = '======STARTING Puzzle %d======';
puzz_end = '======END of Puzzle %d=======';

mp3 = '.mp3';

%%EEG Time Markers
RTurnStart = 000;

PreGrasp = 240;
PreLift = 241;

CorrFreeze = 250;
CorrMove = 251;
CorrLand = 252;
CorrRel = 253;

ErrFreeze = 260;
ErrMove = 261;
ErrLand = 262;
ErrRel = 263;

RcvFreeze = 270;
RcvErrMove = 271;
RcvErrLand = 272;
RcvApolOn = 273;
RcvApolOff = 274;
RcvCorrLift = 275;
RcvCorrLand = 276;
RcvCorrRel = 277;

RTurnEnd = 999;

%##########################################################################
%##############################Correct Puzzles###########################
%##########################################################################
%{

for i = 1:NumCorrPuzz
    %Before the puzzle begins, the experimenter must start with pressing the "S"
    ss1 = sprintf(start_signal, i);
    disp(ss1);
    FlushEvents('keyDown');	% discard previous key presses in the event queue.
    character = GetChar;
    while (character ~= 'S')
        character = GetChar;
    end
    ss2 = sprintf(puzz_starting, i); %Puzzle starting
    disp(ss2);
    pause(3); %pause 3 seconds before starting robot
    
    turnNo = 1;
    
    robot_CorrPuzz
    human_AllPuzz
    
    turnNo = turnNo+1;
    robot_CorrPuzz
    human_AllPuzz
    
    turnNo = turnNo+1;
    robot_ErrPuzz
    human_AllPuzz
    
    turnNo = turnNo+1;
    robot_CorrPuzz
    
    %End of Puzzle
    ss3 = sprintf(puzz_end, i);
    disp(ss3);
end 

%##########################################################################
%##############################Error Puzzles###########################
%##########################################################################

for i = (1+NumCorrPuzz):(NumCorrPuzz+NumErrPuzz)
        %Before the puzzle begins, the experimenter must start with pressing the "S"
    ss1 = sprintf(start_signal, i);
    disp(ss1);
    FlushEvents('keyDown');	% discard previous key presses in the event queue.
    character = GetChar;
    while (character ~= 'S')
        character = GetChar;
    end
    ss2 = sprintf(puzz_starting, i); %Puzzle starting
    disp(ss2);
    pause(3); %pause 3 seconds before starting robot
    
    turnNo = 1;
    
    robot_CorrPuzz
    human_AllPuzz
    
    turnNo = turnNo+1;
    robot_CorrPuzz
    human_AllPuzz
    
    turnNo = turnNo+1;
    robot_CorrPuzz
    human_AllPuzz
    
    turnNo = turnNo+1;
    robot_CorrPuzz
    
    %End of Puzzle
    ss3 = sprintf(puzz_end, i);
    disp(ss3);
end 


%##########################################################################
%##############################Trust Repair Puzzles########################
%##########################################################################
%}

skipNo = 0;
skiplist2 = []; %0 = robot turn skipped, %1 = robot turn retained

for i = (1+NumCorrPuzz+NumErrPuzz):(NumRecovPuzz+NumCorrPuzz+NumErrPuzz)
    %Before the puzzle begins, the experimenter must start with pressing the "S"
    ss1 = sprintf(start_signal, i);
    disp(ss1);
    FlushEvents('keyDown');	% discard previous key presses in the event queue.
    character = GetChar;
    while (character ~= 'S')
        character = GetChar;
    end
    ss2 = sprintf(puzz_starting, i); %Puzzle starting
    disp(ss2);
    pause(3); %pause 3 seconds before starting robot
    
    %%%%%%defining apology label%%%%%%%%5
    if mod(i,2) == 1
        apoLet = 'A';
        puzzleno = 1;
    end
    if mod(i,2) == 0
        apoLet = 'B';
        puzzleno  = 2;
    end
    turnNo = 1;
    
    %**********TURN 1*********
    robot_RcvPuzz;
    skiplist2 = [skiplist2,1];
    
    %**********TURN 2*********
    human_AllPuzz;
    
    %**********TURN 3*********
    RobotturnNo = RobotturnNo+1;cha = '0';
    
    FlushEvents('keyDown');	% discard previous key presses in the event queue.
    cha = GetChar;
    while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
    cha = GetChar
    end
    
    if cha == 's'
        disp("skipping")
        skipNo = skipNo +1;
        skiplist2 = [skiplist2,0];
        %robot_pleading();
        human_AllPuzz;
    elseif cha == 'l'
        disp("robot doing")
        robot_RcvPuzz;
    end
    
    %**********TURN 4*********
    human_AllPuzz;
    
    
    %**********TURN 5********
    
    turnNo = turnNo+1;cha = '0'
    FlushEvents('keyDown');	% discard previous key presses in the event queue.
    cha = GetChar;
    while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
    cha = GetChar
    end
    if cha == 's'
        disp("skipping")
        skipNo = skipNo +1;
        %robot_pleading();
        human_AllPuzz;
    elseif cha == 'l'
        disp("robot doing")
        robot_RcvPuzz;
    end
    
    %**********TURN 6********
    human_AllPuzz;
    
    
    %**********TURN 7********
    
        turnNo = turnNo+1;cha = '0'
    FlushEvents('keyDown');	% discard previous key presses in the event queue.
    cha = GetChar;
    while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
    cha = GetChar
    end
    if cha == 's'
        disp("skipping")
        skipNo = skipNo +1;
        %robot_pleading();
        human_AllPuzz;
    elseif cha == 'l'
        disp("robot doing")
        robot_RcvPuzz;
    end
    
    
    
    
    
    
    %++++++++End of Puzzle+++++++
    ss3 = sprintf(puzz_end, i);
    disp(ss3);
end 

%=====================================================================
%======================END OF EXPERIMENT============================%
%=====================================================================


disp("Experimenter, press 'E' to end experiment")

%At end of the entire experiment, experiment presses CAPITAL "E". 
FlushEvents('keyDown');	% discard previous key presses in the event queue.
character = GetChar;
while (character ~= 'E')
    character = GetChar;
end
disp("End of Experiment")
%send EEG marker to end experiment?

