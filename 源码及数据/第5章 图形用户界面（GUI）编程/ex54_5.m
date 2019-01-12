%% （1）设置命令窗口中数字的显示格式
set(0,'Format','rational')
% >>a=133/444
% a =
%      133/444
%%设置命令窗口中数字的显示格式为short
set(0,'format','short')
% >> a
% a =
%     0.2995
%% （2）查询屏幕尺寸和修改度量单位
get(0,'units')
% ans =
% pixels
get(0,'screensize')
% ans =
%            1           1        1280         800
set(0,'units','inch')
get(0,'screensize')
% ans =
%          0         0   13.3333    8.3333
get(0,'ScreenPixelsPerInch')
% ans =
%     96

%% （3）设置命令窗口中输出内容的行间隔
 get(0,'FormatSpacing')

% ans =
% 
% loose

set(0,'FormatSpacing','compact')
get(0,'FormatSpacing') 
% ans =
% compact

%% （4）控制命令窗口内容的分屏显示
set(0,'more','on')
set(0)
% 	CurrentFigure
% 	Diary: [ on | off ]
% 	DiaryFile
% 	Echo: [ on | off ]
% 	FixedWidthFontName
% 	Format: [ short | long | shortE | longE | shortG | longG | hex | bank | + | rational | debug | shortEng | longEng ]
% 	FormatSpacing: [ loose | compact ]
% 	Language
% 	More: [ on | off ]
% --more--
