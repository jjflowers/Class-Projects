%hand recognition project
%--Jeremiah/Dennis

%clearvars;
hold on;

I = imread('009.png'); 
%I = imcrop(I,[0,0,0,0]);
%I = imrotate(90);
[nrows,ncols, r] = size(I);

%%%%%%kmeans(2)
%cform = makecform('srgb2lab');
%I2 = applycform(I,cform);
%ab = double(I2(:,:,2:3));
%nrows = size(ab,1);
%ncols = size(ab,2);
%ab = reshape(ab,nrows*ncols,2);
%[cluster_idx, cluster_center] = kmeans(ab,2,'distance','sqEuclidean', 'Replicates', 3);
%I = reshape(cluster_idx,nrows,ncols);
%imshow(I,[]);
%sed = strel('diamond',5);
%I = imfill(I,'holes');
%I = imerode(I,sed);



%%%%background subractions -- remove blue
[height,width, r] = size(I);
I = imopen(I,strel('disk',5));

for y = 1:height
    for x = 1:width
        r = I(y,x,1);
        g = I(y,x,2);
        b = I(y,x,3);
       %if((r-20) < (g) && (g) < (b))%BLUE
       if((r) < (g))%GREEN
          I(y,x,:) = 0;
       else
           I(y,x,:) = 255;
       end
    end    
end 

imshow(I);
image = im2bw(I);
close;

%imshow(image, []);



%Values:
%   white=2
%   black=1
%extract contour
scan1 = [5,-1;
        5,-2;
        5,-3;
        5,-4;
        5,-5;
        4,-5;
        3,-5;
        2,-5;   %1 1 1 1 1 1 1 1 1 1 1
        1,-5;   %1 0 0 0 0 0 0 0 0 0 1
        0,-5;   %1 0 0 0 0 0 0 0 0 0 1
        -1,-5;  %1 0 0 0 0 0 0 0 0 0 1
        -2,-5;  %1 0 0 0 0 0 0 0 0 0 1
        -3,-5;  %1 0 0 0 0 * 0 0 0 0 0
        -4,-5;  %0 0 0 0 0 0 0 0 0 0 0
        -5,-5;  %0 0 0 0 0 0 0 0 0 0 0
        -5,-4;  %0 0 0 0 0 0 0 0 0 0 0
        -5,-3;  %0 0 0 0 0 0 0 0 0 0 0
        -5,-2;  %0 0 0 0 0 0 0 0 0 0 0
        -5,-1;
        -5,0;
        10,-2;
        10,-4;
        10,-6;
        10,-8;
        10,-10;
        8,-10;
        6,-10;
        4,-10;
        2,-10;
        0,-10;
        -2,-10;
        -4,-10;
        -6,-10;
        -8,-10;
        -10,-10;
        -10,-8;
        -10,-6;
        -10,-4;
        -10,-2;
        -10,0];
scan2 = [-5,1;
        -5,2;   %0 0 0 0 0 0 0 0 0 0 0
        -5,3;   %0 0 0 0 0 0 0 0 0 0 0 
        -5,4;   %0 0 0 0 0 0 0 0 0 0 0 
        -5,5;   %0 0 0 0 0 0 0 0 0 0 0 
        -4,5;   %0 0 0 0 0 0 0 0 0 0 0 
        -3,5;   %0 0 0 0 0 * 0 0 0 0 1
        -2,5;   %1 0 0 0 0 0 0 0 0 0 1
        -1,5;   %1 0 0 0 0 0 0 0 0 0 1
        0,5;    %1 0 0 0 0 0 0 0 0 0 1
        1,5;    %1 0 0 0 0 0 0 0 0 0 1
        2,5;    %1 1 1 1 1 1 1 1 1 1 1
        3,5;
        4,5;
        5,5;
        5,4;
        5,3;
        5,2;
        5,1;
        5,0;
        -10,2;
        -10,4;
        -10,6;
        -10,8;
        -10,10;
        -8,10;
        -6,10;
        -4,10;
        -2,10;
        0,10;
        2,10;
        6,10;
        8,10;
        10,10;
        10,8;
        10,6;
        10,4;
        10,2;
        10,0];
   

landmark = zeros(11,3);%xy coordinates and position in contour
contour = ones(1,2);%xy coordinates
reader = [ncols,nrows];

if(image(reader(2),reader(1)) == 1)
    POS = 0;
    NEG = 1;
else
    POS = 1;
    NEG = 0;
end

while(image(reader(2),reader(1)) == NEG)
    reader(1) = reader(1) - 1;
end


contour(1,1) = reader(1);
contour(1,2) = reader(2);


path = 1;
%find all landmarks
for L = 2:10
    
    pass = true;
    while(pass)
      if(path == 1)
          RightUp;
      else
          LeftDown;
      end
    end
    
    landmark(L,1) = reader(1);
    landmark(L,2) = reader(2);
    landmark(L,3) = size(contour,1);
    
    if(path == 1)
        path = 2;
    else
        path = 1;
    end
end

%second pass re-adjust landmarks
for L = 3:2:9%adjust bottom of finger landmark
    i = landmark(L,1);
    j = landmark(L,2);
    m = i;
    change = landmark(L,3);
    pass = true;
    while(pass)
        pass = false;%will exit if for loop completes        
        for x = m:(m+20)
           if(image(j,x+1) == NEG)%move right      
               while(image(j+1,x) == NEG)%move down
                  j = j + 1; 
               end          
               i = x;
               j = j + 1;               
               pass = true;%repeat while loop
               break;
           end
        end        
    end    
    landmark(L,1) = i;
    landmark(L,2) = j;
    contour(change,1) = i;
    contour(change,2) = j;    
end

%set final landmark
checkpoint = landmark(9,1);
while(reader(1) < checkpoint)
   LeftDown;
end
landmark(11,1) = reader(1);
landmark(11,2) = reader(2);
landmark(11,3) = size(contour,1);

%set first landmark
pass = true;
m = 0;
checkpoint = landmark(3,2);
while(pass)
    if(contour(1,2) > checkpoint)
        contour(1,:) = [];
        m = m + 1;
    else
        pass = false;
        landmark(:,3) = landmark(:,3) - m;%align all other landmarks
        landmark(1,1) = contour(1,1);
        landmark(1,2) = contour(1,2);
        landmark(1,3) = 1;
    end
end


%adjust thumb tip landmark -- push more left
scan1 = [0,-5;-1,-5;-2,-5;-3,-5;-4,-5;-5,-5;-5,-4;-5,-3;-5,-2;-5,-1;-5,0;-5,1;-5,2;-5,3;-5,4;-5,5;-4,5;
         0,-10;-2,-10;-4,-10;-6,-10;-8,-10;-10,-10;-10,-8;-10,-6;-10,-4;-10,-2;-10,0;-10,2;-10,4;-10,6;-10,8;-10,10];
reader(1) = contour(landmark(10,3),1);
reader(2) = contour(landmark(10,3),2);
pass = true;
while(pass)
    RightUp;    
end
landmark(10,1) = reader(1);
landmark(10,2) = reader(2);

hold on;
plot(contour(:,1),-contour(:,2));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%measure finger using landmarks
fMeasure = zeros(5,151);
level = 0;%both y1 points are on the same level

%%%%%%%little finger
position = 1;

offset = abs(landmark(1,1)+25 - landmark(3,1))/2;%buff the x point out away from the edge of the finger
if(landmark(1,2) < landmark(3,2))
    level = landmark(1,2);
else
    level = landmark(3,2);
end

x1 = landmark(1,1) + 25;
y1 = level;
x2 = landmark(2,1) + offset;
y2 = landmark(2,2);

X1 = linspace(x1,x2,150);%line right of finger
Y1 = linspace(y1,y2,150);

x1 = landmark(3,1);
y1 = level;
x2 = landmark(2,1) - offset;
y2 = landmark(2,2);

X2 = linspace(x1,x2,150);%line left of finger
Y2 = linspace(y1,y2,150);

%round(X1);round(Y1);round(X2);round(Y2);
fingerMeasure;
plot(X1,-Y1,X2,-Y2);
%%%%%%%%%%third finger and middle finger
position = 2;
for q = 3:2:5
    offset = abs(landmark(q,1) + 25 - landmark(q+2,1))/2;%buff the x point out away from the edge of the finger
    if(landmark(q,2) < landmark(q+2,2))
        level = landmark(q,2);
    else
        level = landmark(q+2,2);
    end

    x1 = landmark(q,1);
    y1 = level;
    x2 = landmark(q+1,1) + offset;
    y2 = landmark(q+1,2);

    X1 = linspace(x1,x2,150);%line right of finger
    Y1 = linspace(y1,y2,150);

    x1 = landmark(q+2,1);
    y1 = level;
    x2 = landmark(q+1,1) - offset;
    y2 = landmark(q+1,2);

    X2 = linspace(x1,x2,150);%line left of finger
    Y2 = linspace(y1,y2,150);

    %round(X1(:));round(Y1(:));round(X2(:));round(Y2(:));
    fingerMeasure;
    plot(X1,-Y1,X2,-Y2);
    position = position + 1;
end

%%%%%%%%index finger
position = 4;

y = landmark(9,3);%using landmark(9,:) is not near what we want
while(contour(y,2) > landmark(7,2))
    y = y - 1;
end
reader(1) = contour(y,1) - 25;

offset = abs(landmark(7,1) - reader(1))/2;%width of parallegram
level = landmark(7,2);

x1 = landmark(7,1);
y1 = level;
x2 = landmark(8,1) + offset;
y2 = landmark(8,2);

X1 = linspace(x1,x2,150);%line right of finger
Y1 = linspace(y1,y2,150);

x1 = reader(1);
y1 = level;
x2 = landmark(8,1) - offset;
y2 = landmark(8,2);

X2 = linspace(x1,x2,150);%line left of finger
Y2 = linspace(y1,y2,150);

%round(X1);round(Y1);round(X2);round(Y2);
fingerMeasure;
plot(X1,-Y1,X2,-Y2);
%%%%%%%%thumb
position = 5;
if(abs(landmark(11,2)-size(image,1)) < 50)%%avoid exceed dimension limit
    off = abs(landmark(11,2)-size(image,1));
else
    off = 50;
end

offset = abs((landmark(9,2)-off) - (landmark(11,2)+off))/2;%width of the parallegram
if(landmark(9,1) < landmark(11,1))
    level = landmark(9,1);
else
    level = landmark(11,1);
end

x1 = level;
y1 = landmark(9,2) - off;
x2 = landmark(10,1);
y2 = landmark(10,2) - offset;

X1 = linspace(x1,x2,150);%line top of finger
Y1 = linspace(y1,y2,150);

x1 = level;
y1 = landmark(11,2) + off;
x2 = landmark(10,1);
y2 = landmark(10,2) + offset;

X2 = linspace(x1,x2,150);%line bottom of finger
Y2 = linspace(y1,y2,150);

%round(X1);round(Y1);round(X2);round(Y2);
fingerMeasure2;%samething but made for thumb measure
plot(X1,-Y1,X2,-Y2);
hold off;
round(fMeasure(:,:));

%plot(contour(:,1),-contour(:,2),landmark(:,1),-landmark(:,2))

%read in matrix file 
formatSpec = '%d';
for i = 2:151
    formatSpec = strcat(formatSpec,' %d');
end
formatSpec = strcat(formatSpec,' \n');

rFile = fopen('matrixFile.txt','r');
sizeL = [151 Inf];
dbMeasure = fscanf(rFile,formatSpec,sizeL);
dbMeasure = dbMeasure';
fclose(rFile);

bestScore = 0;
doEnroll = true;
maxEnroll = size(dbMeasure,1);
if(maxEnroll ~= 0)
    for i = 5:5:maxEnroll
        score = 0;
        compare = zeros(5,151);
        compare(1,:) = abs(fMeasure(1,:)-dbMeasure(i-4,:));
        compare(2,:) = abs(fMeasure(2,:)-dbMeasure(i-3,:));
        compare(3,:) = abs(fMeasure(3,:)-dbMeasure(i-2,:));
        compare(4,:) = abs(fMeasure(4,:)-dbMeasure(i-1,:));
        compare(5,:) = abs(fMeasure(5,:)-dbMeasure(i,:));
        
        measurement = [0,compare(1,151);%5x2 matrix
                       0,compare(2,151);
                       0,compare(3,151);
                       0,compare(4,151);
                       0,compare(5,151);];
                   
        %tally mark; thresold: 3
        for p = 1:5
            tally = 0;
            lookup = compare(p,:);
            for q = 1:150
                if(lookup(q) <= 3)
                    tally = tally + 1;
                end
            end
            measurement(p,1) = tally;
        end
        
        measurement
        if(measurement(1,1) > 110)
            score = score + .2;
        end
        if(measurement(2,1) > 110)
            score = score + .2;
        end
        if(measurement(3,1) > 110)
            score = score + .2;
        end
        if(measurement(4,1) > 110)
            score = score + .2;
        end
        if(measurement(5,1) > 50)
            score = score + .2;
        end
        
        if(score > 0.59)      
            doEnroll = false;
            if(score > bestScore)              
                id = round(i/5);
                bestScore = score;
            end    
        end
    end 
else
    i = 0;
end

%write to file 
if((doEnroll))
    i = i + 5;
   dbMeasure = [dbMeasure;fMeasure];

    wFile = fopen('matrixFile.txt','w');
    fprintf(wFile,formatSpec,dbMeasure');
    fclose(wFile); 
    
    fprintf('You are now enrolled as ID:%d, remember it!...\n',round(i/5))
else
    fprintf('You are enrolled as ID: %d...\n',id)
end



