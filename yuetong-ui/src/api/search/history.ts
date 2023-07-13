import { request } from '@/utils/request';

export function allHistoryCarriers(pageNum: number, pageSize: number) {
    return request({
        url: `/transport/cost?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}



