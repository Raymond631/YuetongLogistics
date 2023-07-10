package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.log.annotation.Log;
import cn.tdsmy.log.enums.BusinessType;
import cn.tdsmy.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/system/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/test")
    @Log(title = "日志测试", businessType = BusinessType.OTHER)
    public AjaxResult test() {
        return AjaxResult.success();
    }

    
}
