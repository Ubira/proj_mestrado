function goalConfig(x_obj,y_obj,a2,a3,d5,interval) 
        xPositions = [];
        yPositions = [];
            
    for i=1:1:length(interval) % Interval from minimum angle allowed to the maximum angle given an EOF position
        
        xPosJ2 = a2*cos(interval(i)); % Joint 2 position - X Coordinate
        yPosJ2 = a2*sin(interval(i)); % Joint 2 position - Y Coordinate
        
        xObjTemp = x_obj - xPosJ2; % EOF (Goal) position ignoring link 1
        yObjTemp = y_obj - yPosJ2; % EOF (Goal) position ignoring link 2

        %% ELBOW DOWN FIRST - CPAA.m STANDARD
        [q] = CinematicaInversa(a3, d5, xObjTemp, yObjTemp, -1); % Choose between -1 (Elbow Down) and 1 (Elbow Up)
        [xGC,yGC] = CinematicaDireta(a3, d5, q);
        
        distJ2_to_EOF = CalculateDist(xPosJ2, x_obj, yPosJ2, y_obj) % Calculate distance between joint 2 and goal in each position of Goal Configuration Sample
        
        if (distJ2_to_EOF < a2+d5) && (distJ2_to_EOF > a3-d5) % Check if Goal is inside robot's workspace
            xNew = [];
            yNew = [];
            xNew = [0, xGC + a2*cos(interval(i))];  % New positions for each goal - X Coordinate 
            yNew = [0, yGC + a2*sin(interval(i))];  % New positions for each goal - Y Coordinate

            xPositions = [xPositions; xNew]; % Set of positions - X Coordinates
            yPositions = [yPositions; yNew]; % Set of positions - Y Coordinates

            plotRobot(xNew,yNew,'r', 1)
        end
    end
        assignin('base', 'xPositions', xPositions)
        assignin('base', 'yPositions', yPositions)
end
