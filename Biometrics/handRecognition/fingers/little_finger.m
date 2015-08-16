%measure little finger -- imcrop -> imhist
start = 0;
length = landmark(3,3)-landmark(1,3);
pos = landmark(3,3);
x0 = landmark(3,1);
y0 = landmark(3,2);
width = 0;
height = 0;

for q = start:length
    x = contour(pos,1);
    y = contour(pos,2);
    
    if((x - x0) > width)
        width = (x - x0);
    end
    if((y0 - x) > height)
       height = (y0 - x); 
    end
    
    pos = pos - 1;
end