<template>
  <div id="app">
    <!-- 顶部标题栏header -->
	<mt-header title="信息分享系统">
	  </router-link>
	  <mt-button icon="more" slot="right"></mt-button>
	</mt-header>
	
	<!-- 组件显示区域 -->
	<!-- transition：淡入淡出的过度效果 -->
	<transition name='fade' mode="out-in">
			<router-view></router-view>
	</transition>

	
	
	<!-- 底部选项卡tabbar -->
	<mt-tabbar v-model="selected" fixed>
	  <mt-tab-item id="home" >
	    <img slot="icon" src="./assets/img/index.png" @click="click('Home')">
	    首页
	  </mt-tab-item>
	  <mt-tab-item id="vip">
	    <img slot="icon" src="./assets/img/vip.png" @click="click('Vip')">
	    会员
	  </mt-tab-item>
	  <mt-tab-item id="shopcart">
	    <img slot="icon" src="./assets/img/shopcart.png" @click="click('Shopcart')">
	    购物车
		<mt-badge size="small" type='error'>{{getTotal}}</mt-badge>
	  </mt-tab-item>
	  <mt-tab-item id="find">
	    <img slot="icon" src="./assets/img/find.png" @click="click('Find')">
	    查找
	  </mt-tab-item>
	</mt-tabbar>
	
  </div>
</template>

<script>
import {mapGetters} from 'vuex'
	
export default{
	data(){
		return {
			selected:''
		}
	},
	methods:{
		click(val){
			this.$router.push({
				name:val
			}).catch(err=>err)			
		}
	},
	computed:{
		...mapGetters([
			'getTotal'
		])
	}	
}
</script>

<style>
	.fade-enter-active, .fade-leave-active {
	  transition: opacity .5s;
	}
	.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
	  opacity: 0;
	}
</style>
