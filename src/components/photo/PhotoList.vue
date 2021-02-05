<template>
	<div>
		<Header :title='title'></Header>
		
		<!-- 分类信息区 -->
		<div class="photo-header">
		    <ul>
		        <li v-for='(item,index) in categoryInfo' :key='index'>
		            <a href="javascript:void(0);" @click='navigateToCategoryById(item.id)'>{{item.title}}</a>
		        </li>		       
		    </ul>
		</div>
		
		<!-- 图片展示区 -->
		<div class="photo-list">
		    <ul>
		        <li v-for='(img,index) in imgs' :key='index'>
		            <router-link :to="{ name:'PhotoDetail',params:{id:img.id}}">
		                <img v-lazy= 'img.img_url'>
		                <p>
		                    <span>{{img.title}}</span>
		                    <br>
		                    <span class='zhaiyao'>{{img.zhaiyao}}</span>
		                </p>
		            </router-link>
		        </li>
		    </ul>
		</div>
		
	</div>
</template>

<script>
	export default{
		data(){
			return{
				title:'图片分享',
				imgs:[],
				categoryInfo:[],  //分类信息
			}
		},
		created() {
			let {categoryId} = this.$route.query;		
			//获取分类信息
			this.$axios.get('getCategoryInfo')
			.then(res=>{
				//3:渲染数据
				this.categoryInfo = res.data;	
			})
			.catch(err=>err)	
			
			//获取图片
			this.$axios.get('getPhotoList?cid='+categoryId)
			.then(res=>{
				this.imgs = res.data;
			}) 
		},
		methods:{
			//根据id切换分类
			navigateToCategoryById(id){
				this.$router.push({
					name:'PhotoList',
					query:{categoryId:id}
				}).catch(err=>err) //避面重复导航引发警告
			}
		},
		//因为分类切换时虽然路由换了，但是组件被复用所以钩子函数created没有执行
		//我们就根据分类id重新获取下图片达到页面变化的效果
		beforeRouteUpdate(to,from,next){
			let {categoryId} = to.query;
			this.$axios.get('getPhotoList?cid='+categoryId)
			.then(res=>{
				this.imgs = res.data;
			}) 
			next();
		}	
	}
</script>

<style>
	.photo-header li {
	    list-style: none;
	    display: inline-block;
	    margin-left: 10px;
	    height: 30px;
	}
	
	.photo-header ul {
	    /*强制不换行*/
	    white-space: nowrap;
	    overflow-x: auto;
	    padding-left: 0px;
	    margin: 5;
	}
	
	/*下面的图片*/
	.photo-list{
		margin-bottom: 100px;
	}
	.photo-list li {
	    list-style: none;
	    position: relative;
	}
	
	.photo-list li img {
	    width: 100%;
	    height: 230px;
	    vertical-align: top;
	}
	
	.photo-list ul {
	    padding-left: 0px;
	    margin: 0;
		margin-bottom: 55px;
	}
	
	.photo-list p {
	    position: absolute;
	    bottom: 0px;
	    color: white;
	    background-color: rgba(0, 0, 0, 0.3);
	    margin-bottom: 0px;
	}
	
	.photo-list p span:nth-child(1) {
	    font-weight: bold;
	    font-size: 18px;
	}
	
	/* 图片懒加载 */
	image[lazy=loading] {
	  width: 40px;
	  height: 300px;
	  margin: auto;
	}
</style>
