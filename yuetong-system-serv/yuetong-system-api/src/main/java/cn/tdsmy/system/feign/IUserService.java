package cn.tdsmy.system.feign;


import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.beans.UserInfoVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value = "yuetong-system-impl", path = "/system/inner")
public interface IUserService {
    @PostMapping("/checkPwd")
    public UserInfoVO checkPwd(@RequestBody LoginBody loginBody);

    @GetMapping("/roleId")
    public int getRoleId(@RequestParam String account);

    @GetMapping("/permission")
    public List<String> getPermission(@RequestParam int roleId);
}
