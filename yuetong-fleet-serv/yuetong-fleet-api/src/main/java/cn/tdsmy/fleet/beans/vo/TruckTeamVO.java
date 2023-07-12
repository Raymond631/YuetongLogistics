package cn.tdsmy.fleet.beans.vo;

import cn.tdsmy.fleet.beans.Truck;
import cn.tdsmy.fleet.beans.TruckTeam;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TruckTeamVO {
    private TruckTeam truckTeam;
    private List<Truck> truckList;
}
