import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function searchDrivers(pageNum:number,pageSize:number,queryType:number) {
    return request({
        url: `/fleet/driver?pageNum=${pageNum}&pageSize=${pageSize}&queryType=${queryType}`,
        method: 'get',
    })
}

export function deleteDrivers(userId:number) {
    return request({
        url: `/fleet/driver?userId=${userId}`,
        method: 'delete',
    })  
}
