
import Vuex from 'vuex'
import storage from '../utils/storage'

// 用Vuex.Store对象用来记录token
const store = new Vuex.Store({

  state: {
    // 存储token
    token:"",
    userName:"" // 可选
  },

  getters: {
	getToken(state){
		return state.token || storage.get("token") || "";
	}
  },

  mutations: {
    // 修改token，并将token存入localStorage
    setToken(state,token) {
      state.token = token;
      storage.set('token', token);
      console.log('store、localstorage保存token成功！');
    },
    delToken(state) {
      state.token = "";
      storage.remove("token");
    },
    // 可选
    setUserInfo(state, userName) {
      state.userName = userName;
    }
  },

 actions: {
   // removeToken: (context) => {
     // context.commit('setToken')
   // }
 },
});
  
export default store;
