<template>
    <div>
        <Header title="购物车"/>
        <div class="pay-detail">
            <ul>
                <li class="p-list" v-for="(goods,index) in shopcart" :key="goods.id">
                    <mt-switch v-model="goods.isSelected"></mt-switch>
                    <img :src="goods.img_url">
                    <div class="pay-calc">
                        <p>{{goods.title}}</p>
                        <div class="calc">
                            <span>￥{{goods.sell_price}}</span>
                            <span @click="substract(goods)">-</span>
                            <span>{{goods.buyNum}}</span>
                            <span @click="add(goods)">+</span>
                            <a href="javascript:;" @click="del(goods,index)">删除</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="show-price">
            <div class="show-1">
                <p>总计(不含运费):</p>
                <span>已经选择商品{{pay.count}}件，总价￥{{pay.total}}元</span>
            </div>
            <div class="show-2">
                <mt-button type="danger" size="large">去结算</mt-button>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                shopcart:[],
            }
        },
        methods: {
            del(goods,i) {
                // 删除数组元素
                this.shopcart.splice(i,1);			
				let num = goods.buyNum;
				this.$store.dispatch('changeGoodsByAct',{id:goods.id,num:0-num});						
            },
            substract(goods){
                goods.buyNum --;
				this.$store.dispatch('addGoodsByAct',{id:goods.id,num:-1});
            },
            add(goods){
                goods.buyNum ++;
                //test.goodsObj[goods.id]++;
				this.$store.dispatch('addGoodsByAct',{id:goods.id,num:1});
            }
        },
        computed:{
			//返回购物车中商品件数和总价
            pay(){
            	let count = 0; //件数
            	let total = 0; //总价
            	this.shopcart.forEach(goods=>{
            		//判断商品是否选中
            		if(goods.isSelected){
            			count += (goods.buyNum - 0);
            			total += goods.buyNum * goods.sell_price; 
            		}
            	});
            	return {
            		count,total
            	}
            }
        },
        async created() {
		   //获取购物商品信息
		   let goods = this.$store.getters.getGoods;
		   
		   let key = Object.keys(goods);
		   let url = 'getShopcart?key='+key;
           this.shopcart = (await this.$axios.get(url)).data;
		   
           // 给购物车的每个商品添加购买数量buyNum 和 被选中isSelected 属性          
           for (let i = 0; i< this.shopcart.length ; i ++) {
               let good = this.shopcart[i];
               let num = goods[good.id];
               if(num) {
                    //this.$set通知试图更新，避免点击页面加减购物数量试图不更新
					// 会将shopcart中对象的所有属性进行监视，完成属性的响应式（属性改，页面改）
                    this.$set(good,'buyNum',num);
                    this.$set(good,'isSelected',true);
               }
           }   
        }
    }


</script>
<style scoped>
.pay-detail ul li {
    list-style: none;
    border-bottom: 1px solid rgba(0, 0, 0, 0.2);
    margin-bottom: 3px;
}

.pay-detail ul {
    padding-left: 5px;
    margin-top: 5px;
}

.pay-detail ul li img {
    width: 80px;
    height: 80px;
    display: inline-block;
    vertical-align: top;
    margin-top: 10px;
}

.pay-detail ul li >:nth-child(1),
.pay-detail ul li >:nth-child(3) {
    display: inline-block;
}

.pay-calc p {
    display: inline-block;
    width: 250px;
    overflow: hidden;
    color: blue;
    font-size: 15px;
    margin-bottom: 10px;
}

.pay-detail ul li >:nth-child(1) {
    line-height: 80px;
}

.calc:nth-child(1) {
    color: red;
    font-size: 20px;
}

.calc span:not(:nth-child(1)) {
    border: 1px solid rgba(0, 0, 0, 0.3);
    display: inline-block;
    width: 20px;
    text-align: center;
}

.calc a {
    margin-left: 20px;
}

.show-1,
.show-2 {
    display: inline-block;
}

.show-1,
.show-2 {
    margin-left: 30px;
}

.show-price {
    background-color: rgba(0, 0, 0, 0.2);
	margin-bottom: 100px;
}
</style>
