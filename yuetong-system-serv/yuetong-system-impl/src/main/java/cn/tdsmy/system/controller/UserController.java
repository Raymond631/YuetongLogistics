package cn.tdsmy.system.controller;

import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/system")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 仅供认证中心内网访问
     */
    @PostMapping("/user/checkPwd")
    public boolean checkPwd(@RequestBody LoginBody loginBody) {
        return userService.checkPwd(loginBody);
    }
}
