package cn.tdsmy.system.mapper;

import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    UserInfoVO selectUserByAccAndPwd(LoginBody loginBody);

    int getRoleId(@Param("account") String account);

    String getPermission(@Param("roleId") int roleId);
}
