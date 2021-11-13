%%%%%%%%%%%%%%%%%Human Turn%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%send EEG marker here

human_start() %cue to start, and wait for human to end turn
human_end() 

%send EEG marker here

Current_score = Current_score + 1 ;
added_score = 1;
score_now_msgbox(added_score,Current_score);

thank_human_move() %Thank human for move