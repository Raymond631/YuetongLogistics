import { request } from '@/utils/request';

export function allMaintainCarriers(finishedState:number) {
    return request({
        url: `/transport/capacity/carrier/${finishedState}`,
        method: 'get',
    })
}

