function robot_start()
[y,Fs] = audioread("RobotStart.mp3"); %play robot start
sound(y,Fs); pause(3);
[y,Fs] = audioread("one_beep.mp3"); %play start beep
sound(y,Fs); pause(1);
end