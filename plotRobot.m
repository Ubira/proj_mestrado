function plotRobot(x, y, color, lineWidth)

    if (nargin) > 3
        plot(x,y,'Linewidth',lineWidth,'color',color,'Marker','o','MarkerEdgeColor',[0.7 0.7 0.7],'MarkerSize',7);
    else
        plot(x,y,'Linewidth',2,'color',color,'Marker','o','MarkerEdgeColor',[0.7 0.7 0.7],'MarkerSize',7);
    end
    hold on
end
