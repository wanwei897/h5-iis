<template>
    <div>
        <div class="photo-bottom">
            <ul>
                <li class="txt-comment">
                    <textarea style="width:100%" v-model="content"></textarea>
                </li>
                <li>
                    <mt-button type="primary" size="large" @click="sendMsg">发表评论</mt-button>
                </li>
                <li class="photo-comment">
                    <div>
                        <span>评论列表</span>
                        <span>{{msgs.length}}条评论</span>
                    </div>
                </li>
            </ul>
            <ul class="comment-list" id='comment-list'>
                <li v-for="(msg,index) in msgs" :key="index">
					<div class="info">
						<p class="imgP">
							<img src="http://127.0.0.1:8887/photo/p1.png" alt="">
						</p>
						<p class='textP'>
							{{msg.username}}  
						</p>
						<p class='time'>
							{{ msg.add_time | relativeTime}}
						</p>				
					</div>
					<p class='message'>
						{{msg.content }}
					</p>
                   
                </li>
            </ul>
			<a href="javascript:window.scrollTo(0,0)" class='back'>
				<img src="http://127.0.0.1:8887/icons/top.png" alt="">
			</a>
        </div>
    </div>
</template>
<script>
    export default {
        name:'Comment',
        data() {    
            return {
                content:'',//发表的评论信息
                msgs:[],// 评论信息
            }
        },
        methods: {
            sendMsg() {
				if(!this.content){
					this.$toast({
					  message: '请填写发送的内容',
					  duration: 1000
					});
					return;
				}
				let {id} = this.$route.query;
				let params = new URLSearchParams();
				let username = '匿名用戶';
				//获取当前时间
				var d = new Date();
				var add_time = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
						+" "+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds(); 
				params.append("id",id);	
				params.append("username",username);	
				params.append("add_time",add_time);	
				params.append("content",this.content);	
				
				this.$axios.post('addComments',params)
                .then(res=>{
					this.content = '';
					this.getMsg();
					this.$toast({
					  message: '发送成功',
					  duration: 1000
					});
                })
            },
            getMsg() {
				let {id} = this.$route.query;
                 this.$axios.post('getComments',`id=${id}`)
                .then(res=>{
				   this.msgs = res.data.reverse();
                })
                .catch(console.log)
            },		
        },
        created() {
            this.getMsg();
        }
    }

</script>
<style scoped>
.photo-comment > div span:nth-child(1) {
    float: left;
    font-weight: bold;
    margin-left: 5px;
}

.photo-comment > div span:nth-child(2) {
    float: right;
}

.photo-comment {
    height: 30px;
    border-bottom: 1px solid rgba(0, 0, 0, 0.4);
    line-height: 30px;
    margin-bottom: 5px;
}

.txt-comment {
    padding: 5 5;
}

.txt-comment textarea {
    margin-bottom: 5px;
	height: 70px;
	font-size: 17px;
}
.comment-list{
	padding: 0;
	margin-bottom: 120px;
}
.comment-list li {
    border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	/* height: 24px; */
    padding-bottom: 5px;
    padding-left: 5px;
}
.comment-list{
	overflow: hidden;
	
}
.comment-list .time{
	margin: 0;
	text-align: end;
	font-size: 13px;
	color: gray;
}
.comment-list .imgP{
	height: 30px;
	width: 30px;
	margin: 0;
	float: left;
}
.comment-list .imgP img{
	height: 100%;
	width: 100%;
	border-radius: 25px;
	border: 0.5px solid gray;
}
.comment-list .textP{
	margin: 0;
	margin-left: 10px;
	font-size: 14px;
	color:dodgerblue;
	float:left;
}
.info{
	height: 35px;
	margin-top: 5px;
}
.message{
	margin: -10px 0 0 40px;
	
}

ul {
    margin: 0;
    padding: 0;
}

.tmpl{
	margin-bottom: 100px;
}

.back{
	position: fixed;
	bottom: 140px;
	right: 0;
}

</style>
