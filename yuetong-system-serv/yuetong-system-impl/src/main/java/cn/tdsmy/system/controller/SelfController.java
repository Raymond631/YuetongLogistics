package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.beans.vo.PasswordVO;
import cn.tdsmy.system.beans.vo.PersonInfo;
import cn.tdsmy.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/system/self")
public class SelfController {
    @Autowired
    private UserService userService;

    @GetMapping("/userInfo")
    @Log(title = "查询个人信息", businessType = BusinessType.SELECT)
    public AjaxResult getUserInfo(@RequestHeader("account") String account) {
        User userInfo = userService.getUserInfo(account);
        return AjaxResult.success(userInfo);
    }

    @PutMapping("/userInfo")
    @Log(title = "修改个人信息", businessType = BusinessType.UPDATE)
    public AjaxResult updateUserInfo(@RequestBody PersonInfo info, @RequestHeader("account") String account) {
        userService.updateUserInfo(info, account, new Date());
        return AjaxResult.success("个人信息修改成功");
    }

    @PutMapping("/password")
    @Log(title = "修改个人账号密码", businessType = BusinessType.UPDATE)
    public AjaxResult updatePassword(@RequestBody PasswordVO passwordVO, @RequestHeader("account") String account) {
        userService.updatePassword(passwordVO, account, new Date());
        return AjaxResult.success("密码修改成功");
    }
}
