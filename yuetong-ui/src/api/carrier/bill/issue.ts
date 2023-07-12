import {request} from '@/utils/request';

export function allMyCarrierList(pageNum,pageSize) {
    return request({
        url: `/transport/carrier?pageNum=${pageNum}&pageSize=${pageSize}`,
        method: 'get',
    })
}
