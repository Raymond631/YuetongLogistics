import {request} from '@/utils/request';

export function allMyCarrierList(pageNum,pageSize,queryType) {
    return request({
        url: `/transport/carrier?pageNum=${pageNum}&pageSize=${pageSize}?queryType=${queryType}`,
        method: 'get',
    })
}
