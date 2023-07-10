import { request } from '@/utils/request';

export function allData(finishedState: Number) {
    return request({
        url: `/transport/capacity/carrier/${finishedState}`,
        method: 'get',
    })
}
