import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function operateLog() {
    return request({
        url: '/system/log/operateLog',
        method: 'get',
    })
}

export function loginlog() {
    return request({
        url: '/system/log/loginLog',
        method: 'get',
    })  
}