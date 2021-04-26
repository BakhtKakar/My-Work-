  

 inputDir = 'bakht/'; % this is the input directory
 outputDir = 'bakhtHalfGrayHalfRGB/';% after processing all the jpg images will be stored into png format in this directory
 %catsjpg/*.jpg
 loadJPG = dir([inputDir '*.jpg']); % it loads all the files into variable loadJPG
 
 for i=1:length(loadJPG)
    
    img = imread([inputDir loadJPG(i).name]); 
    name = loadJPG(i).name;
    img(:, 1:end/2, :) = repmat(rgb2gray(img(:, 1:end/2, :)), 1, 1, 3);

    imwrite(img,['bakhtHalfGrayHalfRGB/' loadJPG(i).name]);
 end