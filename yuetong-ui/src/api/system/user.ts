import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function searchUsers(pageSize:number,pageNum:number) {
    return request({
        url: `/system/user?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

export function deleteUser(userId:number) {
    return request({
        url: `/system/user?userId=${userId}`,
        method: 'delete',
    })  
}

export function updateUser(userId:number, roleId:number) {
    return request({
        url: `/system/user?userId=${userId}&roleId=${roleId}`,
        method: 'put',
    })  
}