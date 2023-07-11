package cn.tdsmy.system.beans.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PasswordVO {
    private String oldPassword;
    private String newPassword;
}
