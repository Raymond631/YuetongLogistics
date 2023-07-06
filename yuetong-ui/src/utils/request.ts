import axios from "axios";
import qs from "qs";
import store from "../store";

//导出request方法，供其它地方使用
export function request(config: any) {
  const instance = axios.create({
    // baseURL: "yuetong",
    baseURL: "api/",
    timeout: 5000,
    // 'transformRequest' 允许在向服务器发送前，修改请求数据
    transformRequest: [
      function (data) {
        // 对 data 做序列化处理
        return qs.stringify(data);
      },
    ],
  });

  instance.defaults.headers.post["Content-Type"] =
    "application/x-www-form-urlencoded;charset=UTF-8";

  //------------------请求拦截-------------------//
  instance.interceptors.request.use(
    (config) => {
      const token = store.state.token;
      if (token) {
        // config.headers.Authorization = token;
      }
      // 放行
      return config;
    },
    (err) => {
      console.log("请求拦截=>", err);
      return err;
    }
  );

  //------------------响应拦截-------------------//
  instance.interceptors.response.use(
    (res) => {
      console.log("响应拦截=>", res.data);
      //这里还需要添加一个token过期之后的token移除（如果有的话）
      if (res.data.success == false) {
        alert({
          message: res.data.data.message + "，请重试！",
          type: "warning",
        });
      }
      return res ? res.data : res;
    },
    (err) => {
      console.log("响应拦截错误完整信息=>", err.response);
      throw err;
    }
  );

  return instance(config);
}
