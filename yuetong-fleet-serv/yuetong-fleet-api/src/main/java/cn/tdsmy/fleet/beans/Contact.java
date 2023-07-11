package cn.tdsmy.fleet.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Contact {
    private int contact_id;
    private int fk_truck_id;
    private int fk_driver_id;
}
