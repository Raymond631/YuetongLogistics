import { request } from '@/utils/request';

export function allSchedulingCarriers(pageNum: number, pageSize: number) {
    return request({
        url: `/transport/scheduling/getCarriers?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

export function allFreeTruckAndDriver(pageNum: number, pageSize: number) {
    return request({
        url: `/transport/scheduling/freeTruck?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

