[data,textdate]= xlsread('Hs300.xlsx');
Hs300Date=textdate(3:1325,1);
system('taskkill /F /IM EXCEL.EXE');
Hs300Price=xlsread('Hs300.xlsx', 1, 'B3:B1325');
system('taskkill /F /IM EXCEL.EXE');
Hs300Vol=xlsread('Hs300.xlsx', 1, 'F3:F1325');
system('taskkill /F /IM EXCEL.EXE');
save Hs300 Hs300Date Hs300Price Hs300Vol