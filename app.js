
/* 这是一个node服务器,是项目很重要的部分
项目里所有接口都是这个服务器响应数据回去
所以在项目打开时要开启这个服务器: nodemon app.js,
不然项目里的页面会因为没有接到数据而出现错误 */

const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const homeModel = require('./models/home');
const newListModel = require('./models/newList');
const categoryInfoModel = require('./models/photoList/categoryInfo');
const photoListModel = require('./models/photoList/photoList');
const photoDetailModel = require('./models/photoList/photoDetail');
const commentModel = require('./models/comment');
const goodsListModel = require('./models/goodsList/goodsList')
const shopcart = require('./models/shopcart/shopcart')

//图片分享页面的分类数
var categoryInfo;

//配置服务器
let app = new Koa();
//开启服务器
app.listen(8888, () => {
	console.log('服务器启动在8888端口');
})
app.use(bodyParser());

app.use(async (ctx, next) => {
	//首页
	if (ctx.url == '/') {
		ctx.body = '123';
	}
	//处理轮播图
	if (ctx.url == '/api/getSwipe') {
		let result = await homeModel.findSwipe();
		ctx.body = result;
	}
	//获取新闻资讯
	if (ctx.url == '/api/getNewList') {
		let result = await newListModel.findNewList();
		ctx.body = result;
	}
	
	//获取图片分类信息
	if (ctx.url == '/api/getCategoryInfo') {
		let result = await categoryInfoModel.findCategoryInfo();
		categoryInfo = result.length-1;
		//console.log('categoryInfo:'+categoryInfo);
		ctx.body = result;
	}
	//图片分享
	if (ctx.path == '/api/getPhotoList') {
		//console.log(ctx.request.query);
		let {cid} = ctx.request.query;
		if(cid != 0 ){
			let result = await photoListModel.findPhotoListByCid(cid);
			ctx.body = result;		
		}else{
			let result = await photoListModel.findPhotoList();
			ctx.body = result;
		}
	} 
	//图片详情
	if (ctx.url == '/api/getPhotoDetail') {	
		let {id} = ctx.request.body;
		let result = await photoDetailModel.findPhotoDetailById(id);
		ctx.body = result;
	} 
	//获取图片
	if (ctx.url == '/api/getPhotos') {
		let {id} = ctx.request.body;
		let result = await photoDetailModel.findPhotosById(id);
		ctx.body = result;
	} 
	
	//获取评论
	if (ctx.url == '/api/getComments') {
		let {id} = ctx.request.body;
		let result = await commentModel.findComments(id);
		ctx.body = result;
	} 
	//添加评论
	if (ctx.url == '/api/addComments') {
		let data = ctx.request.body;
		let result = await commentModel.addComments(data);
		ctx.body = result;
	} 
	//商品展示
	if (ctx.path == '/api/getGoodsList') {	
		let {page} = ctx.request.query;
		let result = await goodsListModel.findGoodsList(page);
		ctx.body = result;
	} 
	//商品轮播图
	if (ctx.path == '/api/getGoodsSwipe') {
		let {id} = ctx.request.query;
		let result = await goodsListModel.findGoodsSwipe(id);
		ctx.body = result;
	} 
	//商品信息
	if (ctx.path == '/api/getGoodsInfo') {
		let {id} = ctx.request.query;
		let result = await goodsListModel.findGoodsInfo(id);
		ctx.body = result;
	} 
	//购物车
	if (ctx.path == '/api/getShopcart') {
		//传来的key是字符串，转成数组
		let key = ctx.request.query.key.split(',');
		var result = [];
		for(let i=0;i<key.length;i++){
			result[i] = (await shopcart.findShopcart(key[i]))[0];
		}
		//console.log(result);
		ctx.body = result;
	}
	await next();
});

//处理跨域
app.use(async (ctx, next) => {
	//console.log(ctx.request.header.origin);
	ctx.response.set('Access-Control-Allow-Origin', '*');

	// ctx.response.set('Access-Control-Allow-Origin',ctx.request.header.origin);
	ctx.response.set("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS")
	ctx.response.set("Access-Control-Allow-Headers", 'token');
	// ctx.response.set("Access-Control-Allow-Credentials",true);

	await next();
});

