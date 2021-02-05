export default{
	state:{
		// 购买的物品id:数量  
		goodsObj:{'1':2,'2':5,'3':3}
	},
	getters:{
		getGoods(state){
			return state.goodsObj;
		},
		// 获取商品总数
		getTotal(state){
			return Object.values(state.goodsObj).reduce((prev, cur)=> prev + (cur-0) );
		}
		
	},
	mutations:{
		addGoods(state,obj){
			state.goodsObj[obj.id] += obj.num;
		},
		changeGoods(state,obj){
			state.goodsObj[obj.id] += obj.num;
		},	
		addToShopcart(state,obj){
			// 新加key或者追加value
			if(state.goodsObj[obj.id]) {
			    state.goodsObj[obj.id] += obj.num;
			} else {
			    state.goodsObj[obj.id] = obj.num;
			}
		}
		
		
	},
	//action中的异步行为
	actions:{
		addGoodsByAct({commit},obj){
			commit('addGoods',obj);
		},
		changeGoodsByAct({commit},obj){
			commit('changeGoods',obj)
		},
		addToShopcartByAct({commit},obj){
		 	commit('addToShopcart',obj);
		},
		
	}
}