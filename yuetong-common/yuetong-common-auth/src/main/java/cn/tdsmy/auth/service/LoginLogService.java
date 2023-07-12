package cn.tdsmy.auth.service;

import cn.tdsmy.core.utils.IpUtils;
import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.feign.ISystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class LoginLogService {
    @Autowired
    private ISystemService iSystemService;

    public void recordLoginLog(String account, String status, String message) {
        LoginLog loginLog = new LoginLog();
        loginLog.setAccount(account);
        loginLog.setStatus(status);
        loginLog.setMsg(message);
        loginLog.setAccessTime(new Date());
        loginLog.setIpaddr(IpUtils.getIpAddr());

        iSystemService.saveLoginLog(loginLog);
    }
}
