package cn.tdsmy.system.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Role role;
    private int userId;
    private String account;
    private String password;
    private String username;
    private short sex;
    private String phone;
    private String email;
    private Date checkInTime;
    private short isDelete;
    private Date alterTime;
}
