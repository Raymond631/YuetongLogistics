package cn.tdsmy.transport.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cost {
    private int carriersID;
    private int truckID;
    private String number;
    private int teamID;
    private String teamName;
    private int driverID;
    private String name;
    private int salesmanID;
    private String username;
    private float income;
    private float expenditure;
    private float insuranceCost;
    private float transportCost;
    private float otherIncomeCost;
    private float oilCost;
    private float fine;
    private float toll;
    private float otherExpenditureCost;
    private Date receiveDate;
    private Date alterTime;
}
