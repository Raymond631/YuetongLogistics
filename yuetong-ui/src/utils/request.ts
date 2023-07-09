import axios from "axios";
import store from "../store";
import { Message } from "@element-plus/icons-vue";

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
        return JSON.stringify(data);
      },
    ],
  });

  instance.defaults.headers.post["Content-Type"] = "application/json;";
  //------------------请求拦截-------------------//
  //------------在发送请求之前做些什么------------//
  instance.interceptors.request.use(
    (config) => {
      // 若存在token则带token
      //const token = window.localStorage.getItem('token');
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
  //-------------对响应数据做点什么-------------//
  instance.interceptors.response.use(
    (res) => {
      //例：后端数据处理错误，并返回错误原因；前端获取错误原因并展示
      console.log("响应拦截=>", res.data);
      console.log("响应拦截=>", res);
      //这里还需要添加一个token过期之后的token移除
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
      //也可以在这里对不同的错误码做不同的展示处理
      if (err && err.response) {
        // 1.公共错误处理
        // 2.根据响应码具体处理
        switch (err.response.status) {
          case 400:
            err.message = "错误请求";
            break;
          case 401:
            err.message = "未登录";
            break;
          case 403:
            err.message = "无权限";
            break;
          case 404:
            err.message = "请求错误,未找到该资源";
            window.location.href = "/NotFound";
            break;
          case 405:
            err.message = "请求方法未允许";
            break;
          case 500:
            err.message = "系统内部错误";
            break;
          default:
            err.message = `连接错误${err.response.status}`;
        }
      } else {
        // 超时处理
        if (JSON.stringify(err).includes("timeout")) {
          Message.error("服务器响应超时，请刷新当前页");
        }
        err.message = "连接服务器失败";
      }
      Message.error(err.message);
      throw err;
    }
  );

  return instance(config);
}
