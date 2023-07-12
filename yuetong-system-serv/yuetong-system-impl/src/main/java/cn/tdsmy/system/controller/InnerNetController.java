package cn.tdsmy.system.controller;

import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import cn.tdsmy.system.service.LogService;
import cn.tdsmy.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * TODO 仅限内网访问
 */
@RestController
@RequestMapping("/inner")
public class InnerNetController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;


    /**
     * 检查密码
     */
    @PostMapping("/checkPwd")
    public UserInfoVO checkPwd(@RequestBody LoginBody loginBody) {
        return userService.checkPwd(loginBody);
    }

    /**
     * 获取用户对应的角色
     */
    @GetMapping("/roleId")
    public int getRoleId(@RequestParam String account) {
        return userService.getRoleId(account);
    }

    /**
     * 获取角色对应的权限
     */
    @GetMapping("/permission")
    public List<String> getPermission(@RequestParam int roleId) {
        return userService.getPermission(roleId);
    }


    /**
     * 操作日志
     */
    @PostMapping("/operateLog")
    public void saveOperateLog(@RequestBody OperateLog operateLog) {
        logService.saveLog(operateLog);
    }

    /**
     * 登录日志
     */
    @PostMapping("/loginLog")
    public void saveLoginLog(@RequestBody LoginLog loginLog) {
        logService.saveLog(loginLog);
    }
}
