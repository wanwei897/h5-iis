import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false

//------------------引入mint-ui
import Mint from 'mint-ui'
Vue.use(Mint);
//引入mint-ui的样式
import 'mint-ui/lib/style.css'

//------------------引入全局样式
import './assets/css/global.css'

//------------------引入axios
import Axios from 'axios'
Vue.prototype.$axios = Axios
//设置基础url，因为自己的服务器启动在8888端口
Axios.defaults.baseURL = 'http://localhost:8888/api'

//-----------------引入全局组件
import Header from './components/common/Header'
Vue.component(Header.name,Header);
import Comment from './components/common/Comment'
Vue.component(Comment.name,Comment);

//-----------------引入vue-preview
import VuePreview from 'vue-preview'
Vue.use(VuePreview)

//-----------------全局过滤器、拦截器
// 1.转化为标准时间过滤器 使用moment.js,需要npm install moment
import Moment from 'moment'
Vue.filter('convertTime',function(data,formatStr){
	return Moment(data).format(formatStr);
})
//相对时间过滤器  一天前，2小时前等等
Moment.locale('zh-cn');
Vue.filter('relativeTime', function(time) {
	return Moment(time).fromNow();
});

//2.控制字数显示的过滤器,用于商品标题等的字数过长而只取前面num个
Vue.filter('controlShow',function(str,num){
	//如果当前字符串长度小于num，返回原值,否则截取num个并加上...
	if(str.length<= num){
		return str;
	}else{
		return str.substr(0,num)+'...';
	}	
})

//3.显示loading图标拦截器
//请求发起前显示loading
/* Axios.interceptors.request.use(function(config) {
	Mint.Indicator.open({
		text: '加载中...',
		spinnerType: 'fading-circle'
	});
	//console.log(config);
	return config;
})
//响应回来后关闭loading
Axios.interceptors.response.use(function(response){
	Mint.Indicator.close();
	//console.log(response);
	return response;
}) */


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
