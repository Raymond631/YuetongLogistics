package cn.tdsmy.system.beans.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginBody {
    private String account;
    private String password;
    private String code;
    private String uuid;
}
