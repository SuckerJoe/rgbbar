function rgbbar(bardata,barwidth,ynames,bartext,x_label,y_label)
% - Introduction - It's a function that plots 2D-bars with rgb color
%
% - Inputs -
%
% bardata   -vector:the data used to figure bars,whose number should better not be more than 100
% barwidth  -double:the width of bars
% ynames    -cell(n*1):the text of y-axis if you need
    % example:{'China' 'Korea' 'Janpan'}
% bartext   -cell(n*1):the text of points of bardata
    % example:{'15%' '20%'} or num2str(bardata)
% x_label -char:label of x-axis
% y_label -char:label of y-axis
%
% - Example -
% rgbbar([34.8;36.9;38;38.9;38.7;35.8]',0.4,num2str([2014:2019]'),num2str([34.8;36.9;38;38.9;38.7;35.8]),'年份','京东存货周转天数（天）')
%
% Author: 刘昕瑞
% Email: 1249369848@qq.com
% Release Date: 6/5/2020
switch nargin
    case 1
        barwidth=0.4;
        ynames=[];
        bartext=[];
        x_label=[];
        y_label=[];
    case 2
        ynames=[];
        bartext=[];
        x_label=[];
        y_label=[];
    case 3
        bartext=[];
        x_label=[];
        y_label=[];
    case 4
        x_label=[];
        y_label=[];
    case 5
        y_label=[];
end

% check whether bardata is a column-vector.if not,transfer it to column-vector
if size(bardata,2)>size(bardata,1)
    bardata=bardata';
end

n=length(bardata);
bardata=[bardata,zeros(n,1)];
b=bar3(bardata,barwidth);
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
%change the views from 3D to 2D
view(270,0)

if ~isempty(x_label)
    ylabel(x_label);
end

if ~isempty(y_label)
    zlabel(y_label);
end

if ~isempty(ynames)
    set(gca,'ytick',1:n);
    set(gca, 'YTickLabel', ynames);
    set(gca,'YAxisLocation','origin');
end

ylim([0.0 n+1])
zlim([0 max(bardata(:,1))*1.2])

if ~isempty(bartext)
text(ones(n,1),1:n,bardata(:,1),bartext,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
end
end


