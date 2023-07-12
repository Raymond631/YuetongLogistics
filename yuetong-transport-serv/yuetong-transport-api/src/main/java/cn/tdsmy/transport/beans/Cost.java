package cn.tdsmy.transport.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cost {
    private int carrierId;
    private double oilCost;
    private double toll;
    private double fine;
    private double otherCost;
}
