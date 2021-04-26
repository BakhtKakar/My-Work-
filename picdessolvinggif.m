img = im2double(imread('bk.jpg'));
fd = vision.CascadeObjectDetector;
BB = step(fd, img);
for i=1:size(BB,1)
    face{i}=imcrop(img,BB(i,:));
end
for i=1:length(face)
    face{i}=imresize(face{i},[100 100]);
end
iter = 30;
nimg = face{1} - face{2};
nimg = nimg./iter;
for i=1:iter
    face{2}=face{2} + nimg;
    imshow(face{2});
    pause(0.1);
end