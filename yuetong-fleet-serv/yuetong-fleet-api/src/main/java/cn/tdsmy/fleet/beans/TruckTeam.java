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
public class TruckTeam {

    private int teamId;

    @Excel(name = "车队名称")
    private String teamName;

    @Excel(name = "车队负责人")
    private String leader;

    @Excel(name = "备注")
    private String remark;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkInTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alterTime;
}
