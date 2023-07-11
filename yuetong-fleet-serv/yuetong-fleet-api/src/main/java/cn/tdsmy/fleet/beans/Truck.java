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
public class Truck {
    private int truckId;

    @Excel(name = "车牌号码")
    private String number;

    @Excel(name = "购车日期")
    private String buyDate;

    @Excel(name = "车辆类型")
    private String truckType;

    @Excel(name = "吨位")
    private int tonnage;

    @Excel(name = "所属车队编号")
    private int fkTeamId;

    private String state;

    @Excel(name = "备注")
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkInTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alterTime;
}
