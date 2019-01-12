%code by ariszheng@gmail.com
%2010-6-21
conn=database('ARIS_SQL','sa','ariszheng')
ping(conn)
load Hs300
%%
expData={ '2010-6-21' 2780.66 55260000}
fastinsert(conn, 'StockData.dbo.Hs300',{'Date';'Price';'Vol'}, expData);
%%
e=exec(conn,'SELECT Price,Vol FROM StockData.dbo.Hs300 WHERE Date=''2010-06-21''  ')
e = fetch(e)
e.data
close(conn)
