import { request } from "@/utils/request";

export function teamInfo(pageNum: number, pageSize: number) {
  return request({
    url: `/fleet/team?pageNum=${pageNum}&pageSize=${pageSize}`,
    method: "get",
  });
}

export function teamDelete(teamId: number) {
  return request({
    url: `/fleet/team?teamId=${teamId}`,
    method: "delete",
  });
}
