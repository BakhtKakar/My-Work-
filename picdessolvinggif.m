img=imread('bk.jpg');
img=im2double(img);
fd=vision.CascadeObjectDetector();
bb=step(fd,img);
for i=1:size(bb,1)
    c{i}=imcrop(img,bb(i,:));
end
for i=1:length(c)
    c{i}=imresize(c{i},[200 200]);
end
iter=30;
new=c{i}-c{2};
new=new./iter;
 
for i=3:iter
    c{3}=c{3}+new;
    imshow(c{3});
    pause(0.1);
end
for i=2:iter
    c{2}=c{2}+new;
    imshow(c{2});
    pause(0.1);
end
