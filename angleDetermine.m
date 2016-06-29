function [theta,chainCode] = angleDetermine(dely,delx)

temp = abs(atand(dely/delx));
    if delx > 0 && dely < 0
        theta=temp;
    elseif delx < 0 && dely < 0
        theta=180-temp;
    elseif delx < 0 && dely > 0
        theta=180+temp;
    elseif delx > 0 && dely > 0
        theta=360-temp;
    
    elseif delx == 0 && dely > 0
        theta=270;
    elseif delx == 0 && dely < 0
        theta=90;
    elseif delx > 0 && dely == 0
        theta=0;
    elseif delx < 0 && dely == 0
        theta=180;
    end
   
    % Chain code
    
    if theta <= 45+22.5 && theta > 22.5
        chainCode = 1+1;
    elseif theta <= 90+22.5 && theta > 90-22.5
        chainCode = 2+1;
    elseif theta <= 135+22.5 && theta > 135-22.5
        chainCode = 3+1;
    elseif theta <= 180+22.5 && theta > 180-22.5
        chainCode = 4+1;
    elseif theta <= 225+22.5 && theta > 225-22.5
        chainCode = 5+1;
    elseif theta <= 270+22.5 && theta > 270-22.5
        chainCode = 6+1;
    elseif theta <= 315+22.5 && theta > 315-22.5
        chainCode = 7+1;
    else 
        chainCode = 0+1;
    end
    
end