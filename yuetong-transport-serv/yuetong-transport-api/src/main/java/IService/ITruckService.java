package IService;

import beans.Msg;
import beans.Truck;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(value = "transport-dao", path = "/fleet/truck", contextId = "ITruckService")
public interface ITruckService {

    @PostMapping
    public Msg postTruck(@RequestBody Truck truck);

    @DeleteMapping
    public Msg deleteTruck(@RequestParam(name = "truckID",required = true) int truckID);

    @PutMapping
    public Msg putTruck(@RequestBody Truck truck);

    @GetMapping
    public Msg getTruck(@RequestParam(name = "number",required = true) String number);
}
