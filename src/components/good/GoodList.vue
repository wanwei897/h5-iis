<template>
	<div class="good-list" ref="wrapper">
		<Header title="商品展示" />
		<mt-loadmore :bottom-method="loadBottom" @bottom-status-change="statusChange" :bottom-all-loaded="allLoaded"
		 :auto-fill="autoFill" ref="loadmore">
			<ul>
				<li v-for="goods in goodsList" :key="goods.id">
					<router-link :to="{ name:'GoodDetail',query:{id:goods.id } }">
						<img :src="goods.img_url">
						<div class="title">{{goods.title | controlShow(19) }}</div>
						<div class="desc">
							<div class="sell">
								<span>￥{{goods.sell_price}}</span>
								<s>￥{{goods.market_price}}</s>
							</div>
							<div class="detail">
								<div class="hot">
									热卖中
								</div>
								<div class="count">
									剩{{goods.stock_quantity}}件
								</div>
							</div>
						</div>
					</router-link>
				</li>
			</ul>
		</mt-loadmore>
	</div>
</template>
<script>
	export default {
		data() {
			return {
				goodsList: [], // 商品数据
				allLoaded: false, // 为true禁止调用拉动函数
				autoFill: false, 
				page: 1,
				wrapperHeight: 0, // 父容器高度
			}
		},
		methods: {
			loadGoodsByPage() {
				// 拼接URL 发起请求
				this.$axios.get(`getGoodsList?page=${this.page}`)
					.then(res => {
						let {length} = res.data;
						if (length < 8) {
							this.$toast('没有更多数据了');
							// 没有数据了,就禁止再次下拉
							this.allLoaded = true;
						}

						if (this.page == 1) {
							this.goodsList = res.data;
						} else {
							// 追加
							this.goodsList = this.goodsList.concat(res.data);
						}
					})
					.catch(console.log);
				this.page++; // 页码自增					
			},
			//上拉时状态改变就执行这个函数
			statusChange(status) {
				console.log(status);
			},
			//上拉完成时执行
			loadBottom() {
				this.loadGoodsByPage();
			}

		},
		created() {
			this.loadGoodsByPage();
		},
		mounted() {
		    // 父容器高度（可视） = 设备高度 - 父容器的top
			this.wrapperHeight = document.documentElement.clientHeight - this.$refs.wrapper.getBoundingClientRect().top;
			//给父容器设置高度
			setTimeout(()=>{
				this.$refs.wrapper.style.height = this.wrapperHeight+'px';
			},100)
		}	
	}
</script>
<style scoped>
	ul {
		padding: 0;
		overflow: hidden;
	}

	li {
		width: 50%;
		float: left;
		padding: 6px;
		box-sizing: border-box;
	}


	li>a:not(.mui-btn) {
		margin: 0px;
		padding: 0px;
		border: 1px solid #5c5c5c;
		box-shadow: 0 0 4px #666;
		width: 100%;
		display: block;


	}

	li>a:not(.mui-btn) img {
		width: 100%;
	}

	.sell>span {
		float: left;
		color: red;
		text-align: left;
	}

	.detail>.hot {
		float: left;
		text-align: left;
		font-size: 15px;
	}

	.detail>.count {
		float: right;
		text-align: right;
		font-size: 15px;
	}


	/*撑开，去除浮动没有的高度*/

	.detail {
		overflow: hidden;
	}

	.desc {
		color: rgba(92, 92, 92, 0.8);
		background-color: rgba(0, 0, 0, 0.2);
	}

	.title {
		font-size: 16px;
		color: blue;
		height: 40px;
	}

	img {
		height: 200px;
	}
</style>
