function parseInitState(key:any) {
    return sessionStorage.getItem(key) !=null? sessionStorage.getItem(key) : "";
   }
   
   export default {
    namespace: 'true',
    state: {
      token: parseInitState('token')
    },
    mutations: {
      /**
       * 保存令牌，同步session保存
       * @param state
       * @param token
       */
      saveToken(state:any, token:any) {
        state.token = token;
        sessionStorage.setItem("token", token);
      },
      /**
       *清空所有，同步清空session
       */
      clearSystemInfo(state:any) {
        state.token = "";
        sessionStorage.removeItem("token");
      }
    },
    actions: {
      saveToken(context:any, token:any) {
        context.commit("saveToken", token);
      },
      clearSystemInfo(context:any) {
        context.commit("clearSystemInfo")
      }
   
    },
    getters: {
      token(state:any) {
        return state.token;
      }
    }
   }
   