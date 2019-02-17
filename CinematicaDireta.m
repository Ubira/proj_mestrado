% function [xf,yf] = CinematicaDireta(a2,a3,d5,q,q3)
function [xf,yf] = CinematicaDireta(varargin)

    switch nargin
        case 4
            a2 = varargin{1};  
            a3 = varargin{2};
            d5 = varargin{3};  
            q = varargin{4};  
            xf = [0, a2*cos(q(1)), a2*cos(q(1)) + (a3+d5)*cos(q(1)+q(2))];
            yf = [0, a2*sin(q(1)), a2*sin(q(1)) + (a3+d5)*sin(q(1)+q(2))];
        case 3
            a2 = varargin{1}; 
            a3 = varargin{2};  
            q = varargin{3};  
            xf = [0, a2*cos(q(1)), a2*cos(q(1)) + a3*cos(q(1)+q(2))];
            yf = [0, a2*sin(q(1)), a2*sin(q(1)) + a3*sin(q(1)+q(2))];
        
    end
end