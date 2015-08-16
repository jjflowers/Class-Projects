%measure thimb finger
%round() prevents error on image()
for i = 1:150
    j = 0;
    x = round(X1(i));
    for y = Y1(i):Y2(i)
        y = round(y);
        if(image(y,x) == POS)
            j = j + 1;
        end
    end
    fMeasure(position,i) = j;
end

fMeasure(position,151) = round(norm([X1(1),Y1(1)]-[X1(150),Y1(150)],2));
           