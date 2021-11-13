function human_skip_decision()
FlushEvents('keyDown');	% discard previous key presses in the event queue.
cha = GetChar;
while (cha ~= ['s' 'l']) %s = skip,  l = allow robot's turn
    cha = GetChar;
end
if cha == 's'
    disp("skip robot")
end
if cha =="l"
    disp("robot turn")
end

