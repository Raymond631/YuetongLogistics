import { request } from '@/utils/request';

//导出login方法，供其它地方使用
export function capacityTeam() {
    return request({
        url: '/transport/capacity/team',
        method: 'get',
    })
}

export function capacityTruck() {
    return request({
        url: '/transport/capacity/truck',
        method: 'get',
    })  
}