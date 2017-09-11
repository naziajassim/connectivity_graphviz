function write_dot (mydata, outprefix)  % mydata = weights

    net_names       = {'VIS', 'PN', 'DAN', 'SN', 'LIM','FPN','DMN'};

    within_A_start  = {'e'  , 'e' , 'e'  , 'e' , 'w'  ,'e'  ,'w'};
    within_A_end    = {'ne' , 'ne', 'se' , 'ne', 'nw' ,'ne' ,'nw'};
    
    within_B_start  = {'w'  , 'w' , 'w'  , 'e' , 'w'  ,'e'  ,'w'};
    within_B_end    = {'nw' , 'nw', 'sw' , 'se', 'sw' ,'se' ,'sw'};    
    
    maxval = max (mydata(:));
    setA = [1 3 5 6]
    setB = [2 4 7 8]
    for conpairs = 1:4  

        outname = strcat (outprefix, num2str(setA(conpairs)),'_',num2str(setB(conpairs)),'.txt')
        
        copyfile('header.txt', outname ) ;
        
        fid = fopen (outname,'a');
                  
        conA = squeeze(mydata (setA(conpairs),:,:)  );   % Squeeze makes a 2D Matrix
        conB = squeeze(mydata (setB(conpairs),:,:));   % easier to plot and print values instad of having 1x7x7
        
        conA = tril ( conA );                  % Since the matrix is symmetic
        conB = tril ( conB );                  % plotting lower triangle is sufficient
        
        [numnet, numnet2] = size(conA);

        % % conA: the first contrast
        % % auto generate a line like this:
        % %         
        for i = 1: numnet
            for j = 1: numnet2
                if ( conA(i,j) > 0.0 )
                    % Lthick = conA(i,j) / Lthickfactor;
                    Lthick = line_thickness (conA(i,j), maxval);
                    % Lthick = 2.;
                    if ( i == j )
                        fprintf (fid,'%d:%s -- %d:%s [color=gold,penwidth=%.1f]\n',i,char(within_A_start(i)),j,char(within_A_end(j)),Lthick);
                    else
                        fprintf (fid,'%d -- %d [color=red,penwidth=%.1f]\n',i,j,Lthick);
                    end
                end
            end
        end
    
        % % conB: the second contrast
        % % auto generate a line like this:
        % %         
        for i = 1: numnet
            for j = 1: numnet2
                if ( conB(i,j) > 0.0 )
                    Lthick = line_thickness (conB(i,j), maxval);
                    % Lthick = 2.;
                    if ( i == j )
                        fprintf (fid,'%d:%s -- %d:%s [color=darkturquoise,penwidth=%.1f]\n',i,char(within_B_start(i)),j,char(within_B_end(j)),Lthick);
                    else
                        fprintf (fid,'%d -- %d [color=blue,penwidth=%.1f]\n',i,j,Lthick);
                    end
                end
            end
        end


       fprintf(fid,'\n}\n');
       fclose (fid);
    end % con
end
