const db = require('./db.js');
module.exports= {
	findNewList:()=>{
		return db.q('select * from newList');	
	} 
}