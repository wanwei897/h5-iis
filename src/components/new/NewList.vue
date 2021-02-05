<template>
	<div>
		<Header :title='title'></Header>
		
		<!-- 新闻列表 -->
		<div class="demo">
			<ul>
				<li v-for="(news,index) in newList" :key='index'>
					<router-link :to="{name:'NewDetail',params:{id:news.id}}">
						<img v-lazy="news.img_url" alt="">
						<div>
							<span>{{news.title}}</span>
							<div class='news-desc'>
								<p>点击数:{{news.click}}</p>
								<p>发表时间:{{news.add_time | convertTime('YYYY年MM月DD')}}</p>
							</div>
						</div>
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
				newList:[],
				title:'新闻资讯'
			}
		},
		created() {
			this.$axios.get('getNewList')
				.then(res => {
					this.newList = res.data;
				})
				.catch(err => {
					console.log(err);
				})
		}
		
	}
</script>

<style>
	.demo ul{
		margin-top: 0;
		overflow: scroll;		
	}
	
	.demo a {
	    display: block;
	    width: 100%;
	    height: 44px;
	    color: #000;
	    padding-left:15px;
	}
	.demo li{
		border-bottom: 1.5px solid #42B983;
		height: 72px;
	}
	.demo img {
	    float: left;
	    width: 60px;
	    height: 60px;
	    margin-right: 20px;
	}
	.demo a div {
	    float: left;
	    width: 260px;
	    margin-right: 20px; 
	}
	.demo span {
	    display: block;
	    width: 100%;
	    font-size: 17px;
	    line-height: 21px;
		height: 42px;
		overflow: hidden;
	}
	.demo a p {
	    float: left;
	    color: #0bb0f5;
	    font-size: 14px;
	    line-height: 21px;
		margin-top: 7px;
	}
	.demo p:nth-child(2) {
	    float: right;
	}
	.demo{
		margin-bottom: 55px;
	}
	.demo ul {
	    padding: 0;
	}
	.news-desc {
	    height: 30px;
	}
	image[lazy=loading] {
	  width: 40px;
	  height: 300px;
	  margin: auto;
	}
</style>
