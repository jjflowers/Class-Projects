a = imread('003.jpg');
[height,width, r] = size(a);
a= imopen(a,strel('disk',5));
new = a;

for y = 1:height
    for x = 1:width
        r = a(y,x,1);
        g = a(y,x,2);
        b = a(y,x,3);
       if((r-20) < g & g < b)
          new(y,x,:) = 0; 
       end
    end
    
end 

imshow(new)