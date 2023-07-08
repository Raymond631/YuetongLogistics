package cn.tdsmy.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.tdsmy.auth.captcha.CaptchaService;
import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.beans.UserInfoVO;
import cn.tdsmy.system.feign.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/auth")
public class TokenController {
    @Autowired
    private IUserService iUserService;

    @Autowired
    private CaptchaService captchaService;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        // 检查验证码
        captchaService.checkCaptcha(loginBody.getCode(), loginBody.getUuid());
        // 检查密码
        UserInfoVO userInfo = iUserService.checkPwd(loginBody);
        if (userInfo != null) {
            log.debug(userInfo.toString());
            StpUtil.login(loginBody.getAccount());
            UserInfoVO userInfoVO = new UserInfoVO(userInfo.getUsername(), userInfo.getRoleId(), userInfo.getRoleName());
            return AjaxResult.success("登录成功", userInfoVO);
        } else {
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
