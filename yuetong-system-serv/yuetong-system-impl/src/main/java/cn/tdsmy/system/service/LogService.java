package cn.tdsmy.system.service;

import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import cn.tdsmy.system.mapper.LogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogService {
    @Autowired
    private LogMapper logMapper;

    public void saveLog(OperateLog operateLog) {
        logMapper.insertOperateLog(operateLog);
    }

    public void saveLog(LoginLog loginLog) {
        logMapper.insertLoginLog(loginLog);
    }

    public List<OperateLog> getOperateLog() {
        return logMapper.selectOperateLog();
    }

    public List<LoginLog> getLoginLog() {
        return logMapper.selectLoginLog();
    }
}
