import axios from 'axios';
import qs from 'qs';

//导出request方法，供其它地方使用
export function request(config:any) {
    const instance = axios.create({
        baseURL: 'yuetong',
        timeout: 5000,
        // 'transformRequest' 允许在向服务器发送前，修改请求数据
        transformRequest: [function (data) {
            // 对 data 做序列化处理
            return qs.stringify(data);
        }],
    })

    instance.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';

    //------------------请求拦截-------------------//
    //------------在发送请求之前做些什么------------//
    instance.interceptors.request.use(config => {
        // 若存在token则带token
        const token = window.localStorage.getItem('token');
        if (token) {
            config.headers.Authorization =token;
        }
        // 放行
        return config;
    }, err => {

        console.log("请求拦截=>", err);
        return err;
    })

    //------------------响应拦截-------------------//
    //-------------对响应数据做点什么-------------//
    instance.interceptors.response.use(res => {
        //例：后端数据处理错误，并返回错误原因；前端获取错误原因并展示
        console.log("响应拦截=>", res.data);
        if (res.data.success==false) {
            alert({
                message: res.data.data.message+'，请重试！',
                type: 'warning'
            });
        }
        return res ? res.data : res;
    }, err => {
        console.log("响应拦截错误完整信息=>",err.response)
        //也可以在这里对不同的错误码做不同的展示处理
        throw err;
    })

    return instance(config);
}
