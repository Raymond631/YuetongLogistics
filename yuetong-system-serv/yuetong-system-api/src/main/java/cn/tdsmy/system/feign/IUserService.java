package cn.tdsmy.system.feign;


import cn.tdsmy.system.beans.LoginBody;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(value = "yuetong-system-impl", path = "/system/user")
public interface IUserService {
    @PostMapping("/checkPwd")
    public boolean checkPwd(@RequestBody LoginBody loginBody);
}
