const db = require('../db.js');
module.exports= {
	findGoodsList:(page)=>{
		return db.q('select * from goodsList where page = ?',page);	
	} ,
	findGoodsSwipe:(id)=>{
		return db.q('select * from goodsSwipe where id = ?',id);
	},
	findGoodsInfo:(id)=>{
		return db.q('select * from goodsInfo where id = ?',id);
	}
}