package cn.tdsmy.system.beans;

import cn.tdsmy.core.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Excel(name = "用户角色编号")
    private int roleId;

    private int userId;

    private String account;

    private String password;

    @Excel(name = "用户姓名")
    private String username;

    @Excel(name = "性别")
    private String sex;

    @Excel(name = "联系电话")
    private String phone;

    @Excel(name = "电子邮箱")
    private String email;

    private Date checkInTime;

    private Date alterTime;
}
