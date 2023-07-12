package cn.tdsmy.transport.beans.vo;

import cn.tdsmy.fleet.beans.Driver;
import cn.tdsmy.fleet.beans.Truck;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class TruckAndDriver {
    private Truck truck;
    private Driver driver;
}
