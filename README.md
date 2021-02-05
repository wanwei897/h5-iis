# vue
vue2.0项目：信息分享系统（iss） ,此项目包含前端和后端，前端用vue-cli2，后端服务器用koa，数据库用mysql
------------------------
项目中的文件：
app.js    服务器文件
iss.sql   mysql数据库数据文件
models    数据库操作文件夹 
此项目所有的请求都是由服务器完成，而服务器获取的是数据库中的数据,所以必须连接mysql数据库
------------------------
开始:
mysqld --console
nodemon app.js
npm run serve
