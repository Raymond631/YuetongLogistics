import { request } from "@/utils/request";

//导出login方法，供其它地方使用
export function searchUsers(pageNum: number, pageSize: number) {
  return request({
    url: `/system/user?pageNum=${pageNum}&pageSize=${pageSize}`,
    method: "get",
  });
}

export function deleteUser(userId: number) {
  return request({
    url: `/system/user?userId=${userId}`,
    method: "delete",
  });
}

export function updateUser(userId: number, roleId: number) {
  return request({
    url: `/system/user?userId=${userId}&roleId=${roleId}`,
    method: "put",
  });
}

export function uploadUser(data: any, token: any) {
  return request({
    url: "/system/user/importUser",
    method: "post",
    data: {
      file: data,
    },
    headers: {
      satoken: token,
      Accept: "*/*",
      Host: "localhost:10000",
      Connection: "keep-alive",
      "Content-Type":
        "multipart/form-data; boundary=--------------------------725311584525032455700542",
    },
  });
}
