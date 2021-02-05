<template>
	<div class="temp">
		<!-- 轮播图 -->
		<mt-swipe :auto="3000">
			<mt-swipe-item v-for='(img,index) in imgs' :key='index'>
				<img :src="img.url" >
			</mt-swipe-item>
		</mt-swipe>
		
		<!-- 九宫格 -->
		<div class="grid">
			<ul>
			     <li v-for="(module,index) in modules" :key="index">
			        <router-link :to="module.route">
			          <span :class="module.className"></span>
			          <div>{{module.title}}</div>
			        </router-link>
			    </li>
			</ul>
		</div>
		
	</div>
</template>

<script>
	export default{
		name:'home',
		data(){
			return {
				//轮播图图片
				imgs:[],
				modules:[{
				 title:'新闻资讯',className:'back-news',route:{name:'NewList'}
				},{
				 title:'图文分享',className:'back-pic',route:{name:'PhotoList',query:{categoryId:0} }
				},{
				 title:'商品展示',className:'back-goods',route:{name:'GoodList'}
				},{
				 title:'留言反馈',className:'back-feed',route:{name:'Home'}
				},{
				 title:'搜索咨询',className:'back-search',route:{name:'Home'}
				},{
				 title:'联系我们',className:'back-callme',route:{name:'Home'}
				}]				
			}
		},
		created() {
			//发请求获取轮播图
			this.$axios.get('getSwipe')
				.then(res => {
					this.imgs = res.data;
				})
				.catch(err => {
					console.log(err);
				})
		}
		
	}
</script>

<style >
	/* 轮播图样式 */
	.temp .mint-swipe {
		width: 100%;
		height: 200px;
	}
	.temp .mint-swipe img {
		height: 100%;
		width: 100%;
	}
	
	/* 九宫格样式 */
	.grid li{
	    list-style: none;
	    float: left;
	    width: 33.333%;
	    text-align: center;
		height: 90px;
	}  
	 
	.grid ul {
	   margin:0;
	   padding: 0;
	   /* overflow: hidden; */
	} 
		
	.grid span{
		display: inline-block;
		margin: 10px 27%;
		width: 50px;
		height: 50px;
		background-repeat: round;
	}
	.back-pic {
		background-image: url(../assets/img/picShare.png);
	}
	
	.back-goods {
		background-image: url(../assets/img/goodsShow.png);
	}
	
	.back-feed {
		background-image: url(../assets/img/feedback.png);
	}
	
	.back-search {
		background-image: url(../assets/img/search.png);
	}
	
	.back-callme {
		background-image: url(../assets/img/callme.png);
	}
	
	.back-news {
		background-image: url(../assets/img/news.png);
	}
	
</style>
