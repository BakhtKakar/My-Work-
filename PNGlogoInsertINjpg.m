[logo, map, alpha] = imread('logo.png');


bk = imread('6.jpg');
bkk = imresize(bk, [1000 1200]); %Resize an image
%bmk = imrotate(bmk, 270);          %rotate if required

%// Resize the logo
logoResize = imresize(logo, 0.6, 'bilinear');
%// Make sure you do the same for the alpha map
alphaResize = imresize(alpha, 0.6, 'bilinear');
%// Duplicate the alpha map to make this three channels - This is a colour image
alphaResize = repmat(alphaResize, [1 1 3]);
%// Make double to ensure mixing
alphaResize = im2double(alphaResize);

%// Take the Size of LOGO
%// to properly mix it 
rows = size(logoResize, 1);
cols = size(logoResize, 2);


%FOR TOP LEFT
bkk(1:rows,1:cols,:) = uint8(alphaResize.*double(logoResize) + ...
(1-alphaResize).*double(bkk(1:rows,1:cols,:)));

%FOR TOP RIGHT
%bkk(1:rows,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
%(1-alphaResize).*double(bkk(1:rows,end-cols+1:end,:)));                
                   
                   
%FOR BOTTOM RIGHT
%bkk(end-rows+1:end,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
%(1-alphaResize).*double(bkk(end-rows+1:end,end-cols+1:end,:)));                   
            
%FOR BOTTOM LEFT
%bkk(end-rows+1:end,1:cols,:) = uint8(alphaResize.*double(logoResize) + ...
%(1-alphaResize).*double(bkk(end-rows+1:end,1:cols,:)));
                   
                   
                   
figure; 
imshow(bkk);