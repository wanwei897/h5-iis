const db = require('../db.js');
module.exports= {
	findPhotoDetailById:(id)=>{
		return db.q('select * from photoDetail where id=?',id);	
	} ,
	findPhotosById:(id)=>{
		return db.q('select * from photos where id=?',id);	
	}
}