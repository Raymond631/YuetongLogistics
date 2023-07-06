import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function login(data:any) {
    return request({
        url: 'user/login',
        method: 'post',
        data,
    })
}
export function test(){
    return request({
        url:'/m1/2962122-0-default/fleet/team',
        method:'get',
    })
}
