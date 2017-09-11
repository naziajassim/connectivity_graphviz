function Lthick = line_thickness (conedge, maxval)  % mydata = weights

%                        
%     lwfactor = 0;  % reset
%     Lthick = 0;
%     conedge/maxval
    if ( conedge/maxval > 0.9 )     
        Lthick = 14;
    elseif ( conedge/maxval > 0.8 )     
        Lthick = 12;
    elseif ( conedge/maxval > 0.7 )     
        Lthick = 10;
    elseif ( conedge/maxval > 0.6 )     
        Lthick = 8;
    elseif ( conedge/maxval > 0.5 )     
        Lthick = 6;
    elseif ( conedge/maxval > 0.4 )     
        Lthick = 5;
    elseif ( conedge/maxval > 0.3 )     
        Lthick = 4;
    elseif ( conedge/maxval > 0.2 )     
        Lthick = 3;
    elseif ( conedge/maxval > 0.1 )     
        Lthick = 2;
    elseif ( conedge/maxval > 0.05 )     
        Lthick = 1.;
    elseif  ( conedge/maxval > 0.01 )     
        Lthick = 0.5;
    else
        Lthick = 0.1;
    end

end