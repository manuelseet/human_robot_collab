function score_now_msgbox(x,y);
    score_msg = 'Your current score is %d';
    added_score_msg = '%d points was added to your score';
    
    score_increase = sprintf(added_score_msg, x);
    score_now = sprintf(score_msg, y);
    
    f = msgbox({score_increase;' ' ;score_now},'YOUR SCORE NOW');
end