const db = require('../db.js');
module.exports= {
	findPhotoList:(cid)=>{
		return db.q('select * from photoList');	
	} ,
	findPhotoListByCid:(cid)=>{
		return db.q('select * from photoList where cid=?',cid);	
	} 
}