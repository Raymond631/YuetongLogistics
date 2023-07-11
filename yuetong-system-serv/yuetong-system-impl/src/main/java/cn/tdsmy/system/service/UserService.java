package cn.tdsmy.system.service;

import cn.tdsmy.core.exception.ServiceException;
import cn.tdsmy.core.utils.RandomUtils;
import cn.tdsmy.core.utils.StringUtils;
import cn.tdsmy.system.beans.User;
import cn.tdsmy.system.beans.vo.LoginBody;
import cn.tdsmy.system.beans.vo.PasswordVO;
import cn.tdsmy.system.beans.vo.PersonInfo;
import cn.tdsmy.system.beans.vo.UserInfoVO;
import cn.tdsmy.system.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
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

    public String importUser(List<User> userList) {
        if (StringUtils.isNull(userList) || userList.size() == 0) {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();

        int userCount = userList.size();
        // 查询数据库用户数
        List<String> oldAccounts = userMapper.selectOldAccount();
        // 生成用户名
        List<String> accounts = RandomUtils.getRandomAccounts(oldAccounts, userCount);
        // 生成密码
        List<String> passwords = RandomUtils.getRandomPasswords(userCount, 8);
        // 获取当前时间
        Date now = new Date();

        for (int i = 0; i < userCount; i++) {
            User user = userList.get(i);
            user.setAccount(accounts.get(i));
            user.setPassword(passwords.get(i));
            user.setCheckInTime(now);
            user.setAlterTime(now);
            try {
                userMapper.insertUser(user);
                successNum++;
                successMsg.append("<br/>" + successNum + "、账号 " + user.getUsername() + " 导入成功");
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + user.getUsername() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }

        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

    public List<User> getUserList() {
        return userMapper.selectUser();
    }

    public void deleteUser(int userId) {
        userMapper.deleteUserById(userId);
    }

    public void updateUserRole(int userId, int roleId) {
        userMapper.updateUserRole(userId, roleId);
    }

    public void updateUserInfo(PersonInfo info, String account, Date date) {
        userMapper.updateUserInfo(info, account, date);
    }

    public void updatePassword(PasswordVO passwordVO, String account, Date date) {
        User user = userMapper.checkPwd(account, passwordVO.getOldPassword());
        if (user == null) {
            throw new ServiceException("原密码错误");
        } else {
            userMapper.updatePassword(account, passwordVO.getNewPassword(), date);
        }
    }
}
