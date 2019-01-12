function MyIsosurface(X,Y,Z,V,value)
% 绘制函数V = V(x,y,z)的等值面图
% MyIsosurface(X,Y,Z,V,value) 参数X,Y,Z为三维点坐标，V为相应的函数值，X,Y,Z,V
%                             是相同规模的数组，value用来指定等值面对应函数值.
% CopyRight：xiezhh（谢中华）  2012.2.15

cdata = smooth3(rand(size(V)),'box',5);  % 三维数据平滑
p = patch(isosurface(X,Y,Z,V,value));   % 绘制等值面
isonormals(X,Y,Z,V,p);  % 计算等值面顶点的法线
isocolors(X,Y,Z,cdata,p);  % 计算等值面颜色
% 设置面着色方式为插值着色，设置边线的颜色为无色
set(p,'FaceColor','interp','EdgeColor','none');
view(3);   % 三维视角
axis equal ;  % 设置坐标轴显示比例相同
axis off;  % 不显示坐标轴
camlight; lighting phong;  % 设置光照和光照模式 