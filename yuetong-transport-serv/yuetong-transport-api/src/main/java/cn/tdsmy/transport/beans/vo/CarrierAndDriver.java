package cn.tdsmy.transport.beans.vo;

import cn.tdsmy.fleet.beans.Driver;
import cn.tdsmy.transport.beans.Carrier;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CarrierAndDriver {
    private Carrier carrier;
    private Driver driver;
}
