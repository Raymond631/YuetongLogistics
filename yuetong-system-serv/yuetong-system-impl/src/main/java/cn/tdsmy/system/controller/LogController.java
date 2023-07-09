package cn.tdsmy.system.controller;

import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/system/log")
public class LogController {
    @Autowired
    private LogService logService;

    @PostMapping("/operateLog")
    public void saveOperateLog(@RequestBody OperateLog operateLog) {
        log.error(operateLog.toString());
        logService.saveLog(operateLog);
    }

    @PostMapping("/loginLog")
    public void saveLoginLog(@RequestBody LoginLog loginLog) {
        log.error(loginLog.toString());
        logService.saveLog(loginLog);
    }
}
