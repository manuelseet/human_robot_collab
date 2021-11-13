function human_end()
FlushEvents('keyDown');	% discard previous key presses in the event queue.
character = GetChar;
while (character ~= ' ')
    character = GetChar;
end
[y,Fs] = audioread("one_beep.mp3"); %play start beep
sound(y,Fs*1.2); pause(0.3);
sound(y,Fs*1.2); pause(1);
disp("End of human's turn!")
end