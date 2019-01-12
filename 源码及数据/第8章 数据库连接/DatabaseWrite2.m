%%
load Hs300
N=length(Hs300Price)
for i=1:N
    expData={Hs300Date(i),Hs300Price(i),Hs300Vol(i)};
    fastinsert(conn, 'StockData.dbo.Hs300',{'Date';'Price';'Vol'}, expData);
end
close(conn)