function [stock_Price]=MyYahoo(StockName, StartDate, EndDate, Freq)

% This engine is used for a rapid searching in Yahoo!Finance for retriving
% Financial Data. 

startdate=StartDate;
enddate=EndDate;

ms=num2str(str2num(datestr(startdate, 'mm'))-1);
ds=datestr(startdate, 'dd');
ys=datestr(startdate, 'yyyy');
me=num2str(str2num(datestr(enddate, 'mm'))-1);
de=datestr(enddate, 'dd');
ye=datestr(enddate, 'yyyy');

url2Read=sprintf('http://ichart.finance.yahoo.com/table.csv?s=%s&a=%s&b=%s&c=%s&d=%s&e=%s&f=%s&g=%s&ignore=.csv', StockName, ms, ds, ys, me, de, ye, Freq);
s=urlread(url2Read);
                       
[Date Open High Low Close Volume AdjClose]=strread(s,'%s %s %s %s %s %s %s','delimiter',',');

Date(1)=[];
AdjClose(1)=[];

row=size(Date, 1);
for i = 1:row
    
    Date_temp(i, 1)=datenum(cell2mat(Date(i)), 'yyyy-mm-dd');
    AdjClose_temp(i, 1)=str2num(cell2mat(AdjClose(i)));

end

stock_Price=[Date_temp, AdjClose_temp];

root=[pwd, '\'];
filename=[root, StockName, '.mat'];
save(filename,  'stock_Price') ;

end