package cn.tdsmy.fleet.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Contact {
    private int contactId;
    private int truckId;
    private int driverId;
    private Driver driver;
    private Truck truck;
}
