import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Find from '../views/Find.vue'
import Vip from '../views/Vip.vue'
import Shopcart from '../views/Shopcart.vue'
import NewList from '../components/new/NewList.vue'
import NewDetail from '../components/new/NewDetail.vue'
import PhotoList from '../components/photo/PhotoList.vue'
import PhotoDetail from '../components/photo/PhotoDetail.vue'
import GoodList from '../components/good/GoodList.vue'
import GoodDetail from '../components/good/GoodDetail.vue'
import GoodComment from '../components/good/GoodComment.vue'

Vue.use(VueRouter)

const routes = [
  {
	  path:'/',
	  name:'Home',
	  component:Home
  },{
	  path:'/shopcart',
	  name:'Shopcart',
	  component:Shopcart
  },{
	  path:'/vip',
	  name:'Vip',
	  component:Vip
  },{
	  path:'/find',
	  name:'Find',
	  component:Find
  },{
	  path:'/new-list',
	  name:'NewList',
	  component:NewList
  },{
	  path:'/new-detail/:id',
	  name:'NewDetail',
	  component:NewDetail
  },{
	  path:'/photo-list/:id',
	  name:'PhotoDetail',
	  component:PhotoDetail
  },{
	  path:'/photo-detail',
	  name:'PhotoList',
	  component:PhotoList
  },{
	  path:'/good-list',
	  name:'GoodList',
	  component:GoodList
  },{
	  path:'/good-detail',
	  name:'GoodDetail',
	  component:GoodDetail
  },{
	  path:'/good-comment',
	  name:'GoodComment',
	  component:GoodComment
  }
]

const router = new VueRouter({
  routes
})


export default router
