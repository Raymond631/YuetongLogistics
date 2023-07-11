import { request } from '@/utils/request';

export function allHistoryCarriers() {
    return request({
        url: `/transport/capacity/history`,
        method: 'get',
    })
}



