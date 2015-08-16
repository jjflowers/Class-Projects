%measure little finger
off = 50;
origin = [landmark(3,1);landmark(3,2)];% lower left, also p1
p1 = [landmark(3,1);landmark(2,2)];%upper left
width = abs(landmark(1,1) - landmark(3,1));
xy2 = [landmark(2,1)-(width/2);landmark(2,2)];%want to get point into p1 using rotation matrix

degree = 0;
cont = true;%continue
while(cont)
    degree = degree + 1;
    ang = degtorad(degree);
    rot = [cos(ang),-sin(ang);
           sin(ang),cos(ang)];%rotaion matrix
       
    new = rot*xy2;
    if(new(1) < p1(1))
        cont = false;%found the rotaion matrix
        p1(2) = new(2);
        height = new(2) - origin(2);
        rot = [cos(-ang),-sin(-ang);
               sin(-ang),cos(-ang)];%rotaion matrix
    end
end

x1 = origin(1);
y1 = origin(2);
x2 = xy2(1);
y2 = xy2(2);
X1 = linspace(x1,x2,10);%line left of finger
Y1 = linspace(y1,y2,10);

p2 = [origin(1)+width;origin(2)];%lower right
p3 = [origin(1)+width;origin(2)-width];%upper right
b = rot*p2;
c = rot*p3;

x1 = b(1);
y1 = b(2);
x2 = c(1);
y2 = c(2);
X2 = linspace(x1,x2,10);%line right of finger
Y2 = linspace(y1,y2,10);