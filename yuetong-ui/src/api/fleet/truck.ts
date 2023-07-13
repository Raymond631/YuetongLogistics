import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function searchTruck(pageNum:number,pageSize:number,queryType:number) {
    return request({
        url: `/fleet/truck?pageNum=${pageNum}&pageSize=${pageSize}&queryType=${queryType}`,
        method: 'get',
    })
}

export function deleteTruck(truckId:number) {
    return request({
        url: `/fleet/truck?userId=${truckId}`,
        method: 'delete',
    })
}


export function uploadTruck(data:any) {
    return request({
        url: "v",
        method: 'post',
        data,
        Headers:{
            contentType: 'multipart/form-data'
        }
    })
}


export function contact(truckId:any,driverId:any) {
    return request({
        url: `/fleet/contact?truckId=${truckId}&driverId=${driverId}`,
        method: 'post',
    })
}
