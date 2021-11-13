%verbal pleading
function robot_pleading()
    pleadLabel = strcat(pleadLet,num2str(skipNo),mp3);
    [y,Fs] = audioread(pleadLabel); %play start
    sound(y,Fs); pause(4);
disp("End of human's turn!\n")