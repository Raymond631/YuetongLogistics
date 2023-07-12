import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function operateLog(pageNum:number,pageSize:number) {
    return request({
        url: `/system/log/operateLog?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

export function loginLog(pageNum:number,pageSize:number) {
    return request({
        url: `/system/log/loginLog?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

export function loginLogExport() {
    return request({
        url:"/system/log/exportLoginLog",
        method: 'get',
        Headers:{responseType: 'blob'}
    })
}

export function operateLogExport() {
    return request({
        url:"/system/log/exportOperateLog",
        method: 'get',
        Headers:{ responseType: 'blob'}
    })
}