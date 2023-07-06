package cn.tdsmy.system.mapper;

import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.beans.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    User selectUserByAccAndPwd(LoginBody loginBody);
}
