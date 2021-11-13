function human_start()
[y,Fs] = audioread("HumanStart.mp3"); %play robot start
sound(y,Fs); pause(4);
[y,Fs] = audioread("one_beep.mp3"); %play start double beep
sound(y,Fs*1.2); pause(0.3);
sound(y,Fs*1.2); pause(1);
disp("Human Subject's Turn, waiting to end by keypress")
end