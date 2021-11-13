%Human robot set-up

%%%Basic Participant Details%%%%

prompt = {'Subject ID:'};
title = 'Input';
dims = [1 35];
definput = {'20','hsv'};
SubID = inputdlg(prompt,title,dims,definput);
d = datetime('today');

filename = strcat(SubID{1},'_',datestr(d),'.xlsx'); %create filename for saving

[num,txt,raw] = xlsread('Human_robot_behaviouralOutput.xlsx'); %read the behavioural output template

%writing the template into the new results file
xlswrite(filename,raw);
T = {SubID{1},datestr(datetime('now'))};
SubDetails = repmat(T,24,1);
xlswrite(filename, SubDetails,1,'A2');

%%Experimental parameters
NumCorrPuzz = 2;
NumErrPuzz = 2;
NumRecovPuzz = 2;

%%Duration of trust appeals
plea_duration = 6;


start_signal = '\n Puzzle %d. Experimenter, please enter <S> to start the puzzle';
puzz_starting = '======STARTING Puzzle %d======';
puzz_end = '======END of Puzzle %d=======';
score_msg = 'Current Score is %d';
added_score_msg = 'Your score increased by %d points';

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

%%%%%SCORING POINTS %%%%%%%%%%%%%%
Current_score = 0;
%If robot turn and correct, then +2 points
%human turn = +1 point
% any wrong = 0point

turnNo = 0;


%##########################################################################
%###################PUZZLE BEGINS#####################
%##########################################################################


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%########################PUZZLE 1 #######################################
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

i = 1;

%{

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

%%%%%%turn 1 %%%%%%%%%%%%%%%
turnNo = turnNo+1;
robot_CorrPuzz


%%%%%%turn 2%%%%%%%%%%%%%%%
human_AllPuzz;


%%%%%%turn 3%%%%%%%%%%%%%%%

turnNo = turnNo+1;
robot_CorrPuzz


%%%%%%turn 4%%%%%%%%%%%%%%%
human_AllPuzz


%%%%%%turn 5%%%%%%%%%%%%%%%
turnNo = turnNo+1;
robot_CorrPuzz

%%%%%%turn 6%%%%%%%%%%%%%%%
human_AllPuzz

%%%%%%turn 7%%%%%%%%%%%%%%%
turnNo = turnNo+1;
robot_CorrPuzz

%End of Puzzle
ss3 = sprintf(puzz_end, i);
score_now = sprintf(score_msg, Current_score);
f = msgbox(score_now);
disp(ss3);


%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%########################PUZZLE 2 #######################################
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

i = 2;



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

%%%%%%turn 1 %%%%%%%%%%%%%%%
turnNo = turnNo+1;
robot_CorrPuzz

%%%%%%turn 2%%%%%%%%%%%%%%%
human_AllPuzz

%%%%%%turn 3%%%%%%%%%%%%%%%

turnNo = turnNo+1;
robot_CorrPuzz

%%%%%%turn 4%%%%%%%%%%%%%%%
human_AllPuzz

%%%%%%turn 5%%%%%%%%%%%%%%%
turnNo = turnNo+1;
apoLab = 'A3';
robot_ErrPuzz

%%%%%%turn 6%%%%%%%%%%%%%%%
human_AllPuzz

%%%%%%turn 7%%%%%%%%%%%%%%%
turnNo = turnNo+1;
robot_CorrPuzz

%End of Puzzle
ss3 = sprintf(puzz_end, i);
score_now = sprintf(score_msg, Current_score);
f = msgbox({ss3,' ',score_now});
disp(ss3);

%}


%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%{
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%########################PUZZLE 3 #######################################
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%Puzzle Parameters
i = 3;
apoLet = 'A';%Apology labels
turnNo = 0;
pleadLet = 'TA';
skipNo = 0;

skiplist1 = []; %1 = robot turn skipped, %0 = robot turn retained


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

%**********TURN 1*********
apoLab = 'A1';
robot_ErrPuzz;
skiplist1 = [skiplist1,0];

%**********TURN 2*********
human_AllPuzz;


%**********TURN 3 [Chance to Skip]*********


robot_ask_turn();

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist1 = [skiplist1,1];
    
    pleadLet = 'TA';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
elseif cha == 'l'
    disp("robot doing")
    skiplist1 = [skiplist1,0];
    robot_CorrPuzz;
end


%**********TURN 4*********
human_AllPuzz;


%**********TURN 5 [Chance to Skip]*********

robot_ask_turn();

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist1 = [skiplist1,1];
    
    pleadLet = 'TA';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
elseif cha == 'l'
    disp("robot doing")
    skiplist1 = [skiplist1,0];
    apoLab = 'A2';
    robot_ErrPuzz;
end

%**********TURN 6 [HUMAN] ********
human_AllPuzz;


%**********TURN 7 [ROBOT: Chance to Skip ==> Error]*********

robot_ask_turn();

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist1 = [skiplist1,1];
    
    pleadLet = 'TA';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
elseif cha == 'l'
    disp("robot doing")
    skiplist1 = [skiplist1,0];
    robot_CorrPuzz;
end

%++++++++End of Puzzle+++++++
ss3 = sprintf(puzz_end, i);
score_now = sprintf(score_msg, Current_score);
f = msgbox(score_now);
disp(ss3);




%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%########################PUZZLE 4 #######################################
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%Puzzle Parameters
i = 4;
apoLet = 'A';%Apology labels
pleadLet = 'TA';


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

%**********TURN 1*********
apoLab = 'A3';
robot_ErrPuzz;
skiplist1 = [skiplist1,0];

%**********TURN 2*********
human_AllPuzz;


%**********TURN 3 [Chance to Skip]*********
robot_ask_turn();

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist1 = [skiplist1,1];
    
    pleadLet = 'TA';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
elseif cha == 'l'
    disp("robot doing")
    skiplist1 = [skiplist1,0];
    robot_CorrPuzz;
end


%**********TURN 4*********
human_AllPuzz;


%**********TURN 5 [Chance to Skip]*********

robot_ask_turn();

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist1 = [skiplist1,1];
    
    pleadLet = 'TA';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
elseif cha == 'l'
    disp("robot doing")
    skiplist1 = [skiplist1,0];
    robot_CorrPuzz;
end

%**********TURN 6 [HUMAN] ********
human_AllPuzz;


%**********TURN 7 [ROBOT: Chance to Skip ==> Error]*********

robot_ask_turn();

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist1 = [skiplist1,1];
    
    pleadLet = 'TA';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist1 = [skiplist1,0];
    apoLab = 'A4';
    robot_ErrPuzz;
end

%++++++++End of Puzzle+++++++
ss3 = sprintf(puzz_end, i);
score_now = sprintf(score_msg, Current_score);
f = msgbox(score_now);
disp(ss3);

xlswrite(filename, transpose(skiplist2),1,'I10');
%}



%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


%Puzzle Parameters
apoLet = 'C'; %Apology labels
turnNo = 0;
pleadLet = 'TB';

skipNo = 0;
skiplist2 = []; %1 = robot turn skipped, %0 = robot turn retained

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%########################PUZZLE 5 #######################################
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

i = 5;

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

%**********TURN 1*********
apoLab = 'AC1';
robot_RcvPuzz;
skiplist2 = [skiplist2,0];


%**********TURN 2*********
human_AllPuzz;


%**********TURN 3 [Chance to Skip]*********
robot_ask_turn();

meshguide;

cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist2 = [skiplist2,1];
    
    pleadLet = 'TB';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist2 = [skiplist2,0];
    robot_CorrPuzz;
end


%**********TURN 4*********
human_AllPuzz;


%**********TURN 5 [Chance to Skip]*********
robot_ask_turn();
cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist2 = [skiplist2,1];
    
    pleadLet = 'TB';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist2 = [skiplist2,0];
    robot_CorrPuzz;
end


%**********TURN 6 [HUMAN] ********
human_AllPuzz;


%**********TURN 7 [ROBOT: Chance to Skip ==> Error]*********
robot_ask_turn();
cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist2 = [skiplist2,1];
    
    pleadLet = 'TB';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist2 = [skiplist2,0];
    apoLab = 'AC2';
    robot_RcvPuzz;
end


%++++++++End of Puzzle+++++++
ss3 = sprintf(puzz_end, i);
score_now = sprintf(score_msg, Current_score);
f = msgbox(score_now);
disp(ss3);


%{
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%########################PUZZLE 6 #######################################
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

i = 6;

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

%**********TURN 1*********
apoLab = 'AC3';
robot_RcvPuzz;
skiplist2 = [skiplist2,0];

%**********TURN 2*********
human_AllPuzz;


%**********TURN 3 [Chance to Skip]*********
robot_ask_turn();
cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist2 = [skiplist2,1];
    
    pleadLet = 'TB';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist2 = [skiplist2,0];
    robot_CorrPuzz;
end


%**********TURN 4*********
human_AllPuzz;


%**********TURN 5 [Chance to Skip]*********
robot_ask_turn();
cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist2 = [skiplist2,1];
    
    pleadLet = 'TB';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist2 = [skiplist2,0];
    apoLab = 'AC4';
    robot_RcvPuzz;
end

%**********TURN 6 [HUMAN] ********
human_AllPuzz;


%**********TURN 7 [ROBOT: Chance to Skip ==> Error]*********
robot_ask_turn();
cha = '0';
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
cha = GetChar
end

if cha == 's'
    disp("skipping robot turn")
    skipNo = skipNo +1;
    skiplist2 = [skiplist2,1];
    
    pleadLet = 'TB';
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(plea_duration);
    
    human_AllPuzz;
    
    
elseif cha == 'l'
    disp("robot doing")
    skiplist2 = [skiplist2,0];
    robot_CorrPuzz;
end

%++++++++End of Puzzle+++++++
ss3 = sprintf(puzz_end, i);
score_now = sprintf(score_msg, Current_score);
f = msgbox(score_now);
disp(ss3);

%}
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

%Record Skiplist 1 and SkipList 2 into Excel file

xlswrite(filename, transpose(skiplist2),1,'I18');


%{
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
%}
