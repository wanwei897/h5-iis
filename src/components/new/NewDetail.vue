<template>
	<div>
		<Header :title='title'></Header>
		
		<!-- 新闻详情 -->
		<div class="new-title">
		    <p>{{newInfo.title}}</p>
		    <div>
		        <span>{{newInfo.click}}次点击</span>
		        <span>分类:{{newInfo.sort}}</span><br>
		        <span>添加时间:{{newInfo.add_time | convertTime('YYYY-MM-DD')}}</span>
		    </div>
		</div>
		<div class="new-content" v-html="newInfo.content"></div>
	</div>
</template>

<script>
	export default{
		data() {
		    return {
		        newInfo:{}, // 新闻详情数据
				title:''
		    }
		},
		created() {
			let id = this.$route.params.id-1;
			this.$axios.get('getNewList')
			.then(res=>{
				let data = res.data;
				this.newInfo = data[id];
			})
			.catch(err=>err)
		},
		beforeRouteEnter(to,from,next) {
			let title = '';
			//如果是从商品详情页面过来的话
			if(from.name == 'GoodDetail'){
				title = '商品介绍';
			}else{
				title = '新闻详情';
			}
			
			//这里没有this,因为组件还没有被实例化
			//通过vm访问组件实例，相当于未来的this
			next(vm=>{
				vm.title = title;
			})
		}		
	}
	
</script>

<style>
	.new-title p {
	    color: #0a87f8;
	    font-size: 20px;
	    font-weight: bold;
	}
	
	.new-title span {
	    margin-right: 30px;
	}
	
	.new-title {
	    margin-top: 5px;
	    border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	}
	
	
	/*主体文章的左右距离*/
	
	.new-content {
	    padding: 10 5;
	}
	
</style>
