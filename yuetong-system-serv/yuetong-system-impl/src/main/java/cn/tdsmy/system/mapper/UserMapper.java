package cn.tdsmy.system.mapper;

import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    UserInfoVO selectUserByAccAndPwd(LoginBody loginBody);

    int getRoleId(@Param("account") String account);

    String getPermission(@Param("roleId") int roleId);

    List<String> selectOldAccount();

    void insertUser(User user);
}
