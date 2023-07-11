import { request } from '@/utils/request';

export function allSchedulingCarriers(finishedState:number) {
    return request({
        url: `/transport/capacity/carrier/${finishedState}`,
        method: 'get',
    })
}

export function allFreeTrucks() {
    return request({
        url: `/transport/scheduling/OKTrucksAndDriver`,
        method: 'get',
    })
}

