import { request } from '@/utils/request';

export function allMaintainCarriers(pageNum: number, pageSize: number) {
    return request({
        url: `/transport/cost/getCarriers?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}

