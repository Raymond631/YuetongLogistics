package cn.tdsmy.system.controller;

import cn.tdsmy.core.response.AjaxResult;
import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/system/log")
public class LogController {
    @PostMapping("/operateLog")
    public AjaxResult saveOperateLog(@RequestBody OperateLog operateLog) {
        log.error(operateLog.toString());
        return null;
    }

    @PostMapping("/loginLog")
    public AjaxResult saveLoginLog(@RequestBody LoginLog loginLog) {
        log.error(loginLog.toString());
        return null;
    }
}
