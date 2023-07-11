package cn.tdsmy.system.mapper;

import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.PersonInfo;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface UserMapper {
    UserInfoVO selectUserByAccAndPwd(LoginBody loginBody);

    int getRoleId(@Param("account") String account);

    String getPermission(@Param("roleId") int roleId);

    List<String> selectOldAccount();

    void insertUser(User user);

    List<User> selectUser();

    void deleteUserById(@Param("userId") int userId);

    void updateUserRole(@Param("userId") int userId, @Param("roleId") int roleId);

    void updateUserInfo(PersonInfo info, @Param("account") String account, @Param("date") Date date);

    User checkPwd(@Param("account") String account, @Param("password") String password);

    void updatePassword(@Param("account") String account, @Param("newPassword") String newPassword, @Param("date") Date date);
}
