package cn.tdsmy.system.service;

import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.beans.UserInfoVO;
import cn.tdsmy.system.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
@Slf4j
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public UserInfoVO checkPwd(LoginBody loginBody) {
        return userMapper.selectUserByAccAndPwd(loginBody);
    }

    public int getRoleId(String account) {
        return userMapper.getRoleId(account);
    }

    public List<String> getPermission(int roleId) {
        String permissionString = userMapper.getPermission(roleId);
        String[] permission = permissionString.split("/");
        return Arrays.asList(permission);
    }
}
