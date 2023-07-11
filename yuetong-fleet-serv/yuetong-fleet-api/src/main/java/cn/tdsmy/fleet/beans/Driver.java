package cn.tdsmy.fleet.beans;

import cn.tdsmy.core.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Driver {

    private int driverId;

    @Excel(name = "司机姓名")
    private String name;

    @Excel(name = "性别")
    private String sex;

    @Excel(name = "出生日期")
    private String birth;

    @Excel(name = "联系电话")
    private String phone;

    @Excel(name = "身份证号码")
    private String idCard;

    @Excel(name = "车队编号")
    private int fkTeamId;

    private String state;

    @Excel(name = "备注")
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkInTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alterTime;
}
