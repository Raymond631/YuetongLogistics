package cn.tdsmy.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.feign.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class TokenController {
    @Autowired
    private IUserService iUserService;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        if (iUserService.checkPwd(loginBody)) {
            StpUtil.login(loginBody.getAccount());
            return AjaxResult.success("登录成功");
        } else {
            return AjaxResult.error("用户名或密码错误");
        }
    }

    @DeleteMapping("/logout")
    public AjaxResult logout() {
        StpUtil.logout();
        return AjaxResult.success("退出成功");
    }
}
