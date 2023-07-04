import axios from 'axios'
import store from '../store'

//配置基础url、超时时间、post请求头
axios.defaults.baseURL = '/api';
axios.defaults.timeout = 5000;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

//------------------请求拦截-------------------//
//------------在发送请求之前做些什么------------//
axios.interceptors.request.use(config => {
    //例：若存在token则带token
    const token = store.state.token;
    
    console.log("请求axios");
    if (token) {
        config.headers.Authorization = token
    }
    return config;
}, err => {
    console.log("请求拦截=>", err);
    return err;
})

//------------------响应拦截-------------------//
//-------------对响应数据做点什么-------------//
axios.interceptors.response.use(res => {
    console.log("响应拦截=>", res.data);
    //例：后端数据处理错误，并返回错误原因；前端获取错误原因并展示
    if (res.data.success == false) {
        alert({
            message: res.data.data.message + '，请重试！',
            type: 'warning'
        });
    }
    return res ? res.data : res;
}, err => {
    console.log(err);
    //打印完整的错误信息
    console.log("响应拦截错误完整信息12=>",err.response)
    //也可以在这里对不同的错误码做不同的展示处理
    throw err;
})
