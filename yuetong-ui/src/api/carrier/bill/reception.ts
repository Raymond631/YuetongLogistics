import { request } from '@/utils/request';

export function allReceptionCarriers(pageNum,pageSize) {
    return request({
        url: `/transport/carrier?page=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}
