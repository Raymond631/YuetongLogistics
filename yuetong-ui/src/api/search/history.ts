import { request } from '@/utils/request';

export function allData(finishedState: Number) {
    return request({
        url: `/transport/capacity/carrier/${finishedState}`,
        method: 'get',
    })
}

export function getDriverById(carriersId: Number) {
    return request({
        url: `/transport/capacity/carriersDriver/${carriersId}`,
        method: 'get',
    })
}


