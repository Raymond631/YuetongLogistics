import { request } from '@/utils/request';

export function allReceptionCarriers(pageNum,pageSize,queryType) {
    return request({
        url: `/transport/carrier?pageNum=${pageNum}&pageSize=${pageSize}&queryType=${queryType}`,
        method: 'get',
    })
}

export function confirmReceptedCarriers(carrierId) {
    return request({
        url: `/transport/carrier?carrierId=${carrierId}`,
        method: 'put',
    })
}
