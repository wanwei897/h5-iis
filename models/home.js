const db = require('./db.js');
module.exports= {
	findSwipe:()=>{
		return db.q('select * from home_swipe');	
	} 
	/* updateMusic: music=>{
		return db.q('update musics set title=?,singer=?,time=?,filelrc=?,file=?,uid=? where id = ?',
		Object.values(music));		
	},
	deleteMusicById: id=>{
		return db.q('delete from musics where id = ?',id);
	},
	findMusicById:id=>{
		return db.q('select * from musics where id=?',id);
	},
	findMusicByUid:uid=>{
		return db.q('select * from musics where uid=?',uid);	
	} */
}