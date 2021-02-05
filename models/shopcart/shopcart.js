const db = require('../db.js');
module.exports= {
	findShopcart:(id)=>{
		return db.q('select * from goodslist where id = ?',id);	
	} 
}