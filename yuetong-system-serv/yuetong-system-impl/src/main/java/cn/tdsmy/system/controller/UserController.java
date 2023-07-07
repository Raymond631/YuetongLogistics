package cn.tdsmy.system.controller;

import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.beans.UserInfoVO;
import cn.tdsmy.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * TODO 仅限内网访问
     */
    @PostMapping("/inner/checkPwd")
    public UserInfoVO checkPwd(@RequestBody LoginBody loginBody) {
        return userService.checkPwd(loginBody);
    }

    @GetMapping("/inner/roleId")
    public int getRoleId(@RequestParam String account) {
        return userService.getRoleId(account);
    }

    @GetMapping("/inner/permission")
    public List<String> getPermission(@RequestParam int roleId) {
        return userService.getPermission(roleId);
    }
}
