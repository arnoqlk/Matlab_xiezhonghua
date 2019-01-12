function new_model(modelname)
% 使用NEW_MODEL创建一个新的空白Simulink模型
% NEW_MODEL('MODELNAME') 创建一个名为'MODELNAME'的新模型
% 没有'MODELNAME'参数，新模型默认命令为'my_untitled'，（Simulink系统默认为'untitled'）

if nargin == 0
modelname = 'my_untitled';  % 自已定制默认的模型名
end
% 创建和打开一个模型
open_system(new_system(modelname));
% 设置缺省屏幕颜色
set_param(modelname, 'ScreenColor', 'blue');
% 设置默认求解器
set_param(modelname, 'Solver', 'ode3');
% 设置缺省工具栏的可见性
set_param(modelname, 'Toolbar', 'off');
% 保存模型
save_system(modelname);
