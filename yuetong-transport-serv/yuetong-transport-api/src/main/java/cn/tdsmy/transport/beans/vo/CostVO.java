package cn.tdsmy.transport.beans.vo;

import cn.tdsmy.fleet.beans.Driver;
import cn.tdsmy.transport.beans.Carrier;
import cn.tdsmy.transport.beans.Scheduling;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CostVO {
    private Carrier carrier;
    private Scheduling scheduling;
    private Driver driver;
}
