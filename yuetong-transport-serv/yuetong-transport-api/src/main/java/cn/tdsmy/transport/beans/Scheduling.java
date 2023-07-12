package cn.tdsmy.transport.beans;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Scheduling {
    private int schedulingId;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    private int fkCarriersId;
    private int fkTruckId;

    // 完成后补充
    private double oilCost;
    private double toll;
    private double fine;
    private double otherCost;
    private double totalCost;

    private String account;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkInTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date alterTime;

    public Scheduling(int carrierId, int truckId, String account) {
        Date now = new Date();
        this.startTime = now;
        this.fkCarriersId = carrierId;
        this.fkTruckId = truckId;
        this.account = account;
        this.checkInTime = now;
        this.alterTime = now;
    }
}
