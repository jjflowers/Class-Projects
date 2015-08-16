%loop through scan2 to find new reader point
for q = 1:40
    if(image(reader(2)+scan2(q,2),reader(1)+scan2(q,1)) == POS)
       if(q == 1)%if on first scan a new point is found
          j = reader(2)+scan2(q,2);   
          i = reader(1)+scan2(q,1);                  
          inRegion = false;
          
          %scan 4s4 region of the new reader point found
          for x = -4:4
             if(image(j+4,i+x) == NEG || image(j-4,i+x) == NEG)
                 inRegion = true;
                 break;
             end
          end
          for y = -4:4
             if(image(j+y,i+4) == NEG || image(j+y,i-4) == NEG)
                 inRegion = true;
                 break;
             end
          end 
          
          if(inRegion)
              reader(2) = j;
              reader(1) = i;
              contour = [contour;reader];
              break; 
          else%found new landmark
              pass = false;
              for q = 1:15
                 if(image(j-1,i) == POS)%move up
                     j = j - 1;
                 else
                     break;
                 end
              end
              for q = 1:15
                 if(image(j,i+1) == POS) %%move right
                     i = i + 1;
                 else
                     break;
                 end
              end
              
              reader(2) = j;
              reader(1) = i;
              m = size(contour,1);
              contour(m,2) = reader(2);
              contour(m,1) = reader(1);
              break;
          end
          
       else
          reader(2) = reader(2)+scan2(q,2);
          reader(1) = reader(1)+scan2(q,1);
          contour = [contour;reader];
          break;            
       end     
    end   
end

