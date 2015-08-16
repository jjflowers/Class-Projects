%only if the loop completes will this take effect
pass = false;
for q = 1:33
   if(image(reader(2)+scan1(q,2),reader(1)+scan1(q,1)) == POS)
       reader(2) = reader(2)+scan1(q,2);
       reader(1) = reader(1)+scan1(q,1);
       contour = [contour;reader];
       pass = true;
      break; 
   end  
end