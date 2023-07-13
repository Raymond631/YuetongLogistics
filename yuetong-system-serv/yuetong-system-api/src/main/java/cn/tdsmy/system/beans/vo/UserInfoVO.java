package cn.tdsmy.system.beans.vo;

import cn.dev33.satoken.stp.SaTokenInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoVO {
    private String username;
    private int roleId;
    private String roleName;
    private SaTokenInfo tokenInfo;
}

