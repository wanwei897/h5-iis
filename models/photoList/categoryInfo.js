const db = require('../db.js');
module.exports= {
	findCategoryInfo:()=>{
		return db.q('select * from categoryInfo');	
	} 
}