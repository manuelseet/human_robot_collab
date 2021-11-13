%function for displaying picture on a MATLAB experimental screen

function pic_disp(a,b) %x = name of file, y = 
picture_file = imread(a);                                       %x = name of file
resized_pic = imresize(picture_file, b);                        %y = resizing proportion (e.g. 0.5) 
picture_filedisp = Screen('MakeTexture', window, resized_pic);  
Screen('DrawTexture', window, picture_filedisp, [], [], 0);     % c = source, d = picture 
end