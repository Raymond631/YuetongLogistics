package cn.tdsmy.system.feign;


import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(value = "yuetong-system-impl", path = "/system")
public interface ISystemService {
    @PostMapping("/inner/checkPwd")
    public UserInfoVO checkPwd(@RequestBody LoginBody loginBody);

    @GetMapping("/inner/roleId")
    public int getRoleId(@RequestParam String account);

    @GetMapping("/inner/permission")
    public List<String> getPermission(@RequestParam int roleId);

    @PostMapping("/log/operateLog")
    public AjaxResult saveOperateLog(@RequestBody OperateLog operateLog);

    @PostMapping("/log/loginLog")
    public AjaxResult saveLoginLog(@RequestBody LoginLog loginLog);
}
