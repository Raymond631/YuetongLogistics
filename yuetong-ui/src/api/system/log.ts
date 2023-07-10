import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function operateLog(pageNum,pageSize) {
    return request({
        url: `/system/log/operateLog?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

export function loginlog(pageNum,pageSize) {
    return request({
        url: `/system/log/loginLog?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}
