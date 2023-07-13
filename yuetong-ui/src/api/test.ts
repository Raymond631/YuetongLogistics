import { request } from '../utils/request';

//导出login方法，供其它地方使用
export function test1() {
    return request({
        url: 'fleet/team',
        method: 'get',
    })
}