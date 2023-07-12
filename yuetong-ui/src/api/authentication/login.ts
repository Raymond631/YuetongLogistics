import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function login(data:any) {
    return request({
        url: '/auth/login',
        method: 'post',
        data,
    })
}

export function vertify() {
    return request({
        url: '/auth/code',
        method: 'get',
    })  
}

export function logout() {
    return request({
        url: '/auth/logout',
        method: 'delete',
    })  
}