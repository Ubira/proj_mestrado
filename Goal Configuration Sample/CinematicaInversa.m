function [q] = CinematicaInversa(varargin)
    %% INVERSE KINEMATICS FOR A 2 PLANAR ROBOT
    
    switch nargin
        case 6
            a1 = varargin{1};
            a2 = varargin{2};
            a3 = varargin{3};
            x = varargin{4};
            y = varargin{5};
            elbow = varargin{6};
            a2 = a2+a3;
            q2 = -1*elbow*2*atan(((- a1^2 + 2*a1*a2 - a2^2 + x^2 + y^2)*(a1^2 + 2*a1*a2 + a2^2 - x^2 - y^2))^(1/2)/(- a1^2 + 2*a1*a2 - a2^2 + x^2 + y^2));

            q1 = 2*atan((2*a1*y + elbow*(- a1^4 + 2*a1^2*a2^2 + 2*a1^2*x^2 + 2*a1^2*y^2 - a2^4 + 2*a2^2*x^2 + 2*a2^2*y^2 - x^4 - 2*x^2*y^2 - y^4)^(1/2))/(a1^2 + 2*a1*x - a2^2 + x^2 + y^2));

            q = [q1, q2];
        case 5
            a1 = varargin{1};
            a2 = varargin{2};
            x = varargin{3};
            y = varargin{4};
            elbow = varargin{5};
%             D = (x_obj^2 + y_obj^2 - a3^2 - d5^2)/(2 * a3 * d5);
            % q2 = atan(elbow*(sqrt(1 - D^2) / D));
            q2 = -1*elbow*2*atan(((- a1^2 + 2*a1*a2 - a2^2 + x^2 + y^2)*(a1^2 + 2*a1*a2 + a2^2 - x^2 - y^2))^(1/2)/(- a1^2 + 2*a1*a2 - a2^2 + x^2 + y^2));

            % q1 = atan2(y_obj,x_obj) - atan((d5 * sin(q2))/(a3 + d5*cos(q2)));
            q1 = 2*atan((2*a1*y + elbow*(- a1^4 + 2*a1^2*a2^2 + 2*a1^2*x^2 + 2*a1^2*y^2 - a2^4 + 2*a2^2*x^2 + 2*a2^2*y^2 - x^4 - 2*x^2*y^2 - y^4)^(1/2))/(a1^2 + 2*a1*x - a2^2 + x^2 + y^2));

            q = [q1, q2];
    end
end