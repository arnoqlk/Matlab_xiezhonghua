%%
%连接数据库
conn=database('ARIS_SQL','sa','ariszheng')
%%
%得到数据库连接信息
ping(conn);
%%
%查询数据库
e = exec(conn,'SELECT ALL Price FROM StockData.dbo.Hs300 WHERE Date BETWEEN ''2008-01-01'' AND ''2010-01-01''  ')
%%
%将查询结果导入数据到MATLAB单元数组
e = fetch(e)
e.data
%%
close(conn)



