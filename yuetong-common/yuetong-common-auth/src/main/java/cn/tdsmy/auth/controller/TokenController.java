package cn.tdsmy.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.tdsmy.auth.service.CaptchaService;
import cn.tdsmy.auth.service.LoginLogService;
import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import cn.tdsmy.system.feign.ISystemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/auth")
public class TokenController {
    @Autowired
    private ISystemService iSystemService;

    @Autowired
    private CaptchaService captchaService;

    @Autowired
    private LoginLogService loginLogService;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        // 检查验证码
        captchaService.checkCaptcha(loginBody.getCode(), loginBody.getUuid(), loginBody.getAccount());
        // 检查密码
        UserInfoVO userInfo = iSystemService.checkPwd(loginBody);
        if (userInfo != null) {
            StpUtil.login(loginBody.getAccount());
            UserInfoVO userInfoVO = new UserInfoVO(userInfo.getUsername(), userInfo.getRoleId(), userInfo.getRoleName());
            loginLogService.recordLoginLog(loginBody.getAccount(), "success", "登录成功");
            return AjaxResult.success("登录成功", userInfoVO);
        } else {
            loginLogService.recordLoginLog(loginBody.getAccount(), "fail", "用户名或密码错误");
            return AjaxResult.error("用户名或密码错误");
        }
    }

    @DeleteMapping("/logout")
    public AjaxResult logout() {
        StpUtil.logout();
        return AjaxResult.success("退出成功");
    }

    /**
     * 获取验证码
     */
    @GetMapping("/code")
    public Object getCaptcha() {
        return captchaService.createCaptcha();
    }
}
