const db = require('./db.js');
module.exports= {
	findComments:(id)=>{
		return db.q('select * from comment where id =?',id);	
	} ,
	addComments:(data)=>{
		return db.q('insert into comment (id,username,add_time,content) values (?,?,?,?)',Object.values(data));
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