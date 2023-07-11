import { request } from '@/utils/request';

export function allReceptionCarriers(fkUserID:number) {
    return request({
        url: `/transport/carrier/toBeAccepted/${fkUserID}`,
        method: 'get',
    })
}
