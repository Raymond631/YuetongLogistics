package cn.tdsmy.system.mapper;

import cn.tdsmy.system.beans.LoginLog;
import cn.tdsmy.system.beans.OperateLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LogMapper {
    void insertOperateLog(OperateLog operateLog);

    void insertLoginLog(LoginLog loginLog);

    List<OperateLog> selectOperateLog();

    List<LoginLog> selectLoginLog();
}
