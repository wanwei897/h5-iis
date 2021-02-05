<template>
	<div class='header'>
		<mt-header :title='title'>
		  <div slot="left" @click='goBack'>
		    <mt-button icon="back" >返回</mt-button>
		  </div>
		</mt-header>
	</div>
</template>

<script>
	export default {
		name:'Header',
		data(){
			return{
				
			}
		},
		props:['title'],  //接收父组件传来的title作为标题显示
		methods:{
			//返回上一步
			goBack(){
				this.$router.go(-1);
			}
		}
	}
</script>

<style>
	.header .mint-header{
		background-color: #42B983;
	}
</style>
