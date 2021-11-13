function thank_human_move()
[y,Fs] = audioread("ThankHumanTurn.mp3"); %play start beep
sound(y,Fs); pause(2);
end