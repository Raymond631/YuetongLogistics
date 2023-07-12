package cn.tdsmy.transport.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Scheduling {
    private int schedulingID;
    private Date startTime;
    private int fkCarriersID;
    private int fkTruckID;
    private float oilCost;
    private float toll;
    private float fine;
    private float otherCost;
    private float totalCost;
    private float fkUserID;
    private String remark;
    private Date checkInTime;
    private short isDelete;
    private Date alterTime;
}
