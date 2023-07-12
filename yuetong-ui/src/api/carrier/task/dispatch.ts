import { request } from '@/utils/request';

export function allSchedulingCarriers() {
    return request({
        url: `/transport/scheduling/getCarriers`,
        method: 'get',
    })
}

export function allFreeTruckAndDriver() {
    return request({
        url: `/transport/scheduling/freeTruck`,
        method: 'get',
    })
}

