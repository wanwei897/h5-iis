var mysql = require('mysql');
var dbConfig = {
    connectionLimit : 10,
    host            : 'localhost',
    user            : 'root',
    password        : '',
    database        : 'iss'
  }
// 创建连接池,使用的时候,getConnection  施放连接回池子的时候release
var pool  = mysql.createPool(dbConfig);
 
let db = {};

db.q = function (sql,params) {
  return new Promise((resolve,reject)=>{
    // 取出链接
    pool.getConnection(function(err, connection) {
      if (err) {
        reject(err);
        return;
      }
      connection.query(sql,params, function (error, results, fields) {
            console.log(`${sql}=>${params}`);
             // 释放连接
            connection.release();
            if(error) {
              reject(err);
              return;
            }
            resolve(results);  
      });
    });
  });
}

// 导出db对象
module.exports = db; 