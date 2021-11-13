function robot_ask_turn()
    disp("--------Subject Decision Making-------------")
    ask_decision = 'asknow.mp3';
    [y,Fs] = audioread(ask_decision); %play start
    sound(y,Fs); pause(4);
end
