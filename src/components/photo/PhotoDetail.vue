<template>
    <div>  
        <Header title="图文详情"/>
		
		<!-- 头部 -->
        <div class="photo-title">
            <p>{{photoInfo.title}}</p>
            <span>发起日期：{{photoInfo.add_time | convertTime('YYYY年MM月DD日')}}</span>
            <span>{{photoInfo.click}}次浏览</span>		
        </div>
				
		<!-- 预览图片区，点击可预览图片 npm i vue-preview -S-->
		<div class='my-preview'>
			<vue-preview :slides="imgs" @close="handleClose"></vue-preview>
		</div>
        
		<!-- 内容区 -->
		<div class="photo-desc">
            <p v-html="photoInfo.content"></p>
        </div>
			 
    </div>	
</template>
<script>

    export default {
        data() {
            return {
                photoInfo:{}, //图文详情
                imgs:[], //缩略图
            }
        },
        created() {
			 // 发起请求 获取详情信息
            let id = this.$route.params.id;          
            this.$axios({
				method: 'post',
				url: 'getPhotoDetail',
				data: 'id='+id
			})
            .then(res=>{
                let data = res.data[0];
				this.photoInfo = data;
            })
            .catch(console.log);
			
			//发起请求，获取图片
			this.$axios({
				method: 'post',
				url: 'getPhotos',
				data: 'id='+id
			})
			.then(res=>{
				this.imgs = res.data;
			})
			.catch(console.log);
        },
		methods: {
		      handleClose () {
		        console.log('close event')
		      }
		}		
    }
	
</script>
<style scoped>
li {
    list-style: none;
}

ul {
    margin: 0;
    padding: 0;
}

.photo-title {
    overflow: hidden;
}

.photo-title,
.photo-desc {
    border-bottom: 1px solid rgba(0, 0, 0, 0.2);
    padding-bottom: 5px;
    margin-bottom: 5px;
    padding-left: 5px;
}

.photo-title p {
    color: #13c2f7;
    font-size: 20px;
    font-weight: bold;
}

.photo-title span {
    margin-right: 20px;
}

.photo-desc p {
    font-size: 18px;
	margin-bottom: 140px;
}

.comment{
	margin-bottom: 100px;
}


</style>
 