package cn.tdsmy.system.service;

import cn.tdsmy.system.beans.LoginBody;
import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public boolean checkPwd(LoginBody loginBody) {
        User user = userMapper.selectUserByAccAndPwd(loginBody);
        return user != null;
    }
}
