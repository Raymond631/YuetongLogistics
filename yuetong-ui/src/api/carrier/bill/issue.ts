import {request} from '@/utils/request';

export function allMyCarrierList(pageNum, pageSize, queryType) {
    return request({
        url: `/transport/carrier?pageNum=${pageNum}&pageSize=${pageSize}?queryType=${queryType}`,
        method: 'get',
    })
}

export function confirmIssueCarrier(data) {
    return request({
        url: `/transport/carrier`,
        method: 'post',
        data,
    })
}
