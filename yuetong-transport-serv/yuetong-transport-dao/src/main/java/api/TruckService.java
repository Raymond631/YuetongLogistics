package api;

import beans.Msg;
import beans.Truck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

@RestController
@Service
@RequestMapping("/fleet/truck")
public class TruckService {

    @Autowired
    Msg msg;

    @PostMapping
    public Msg postTruck(@RequestBody Truck truck){
        return msg;
    }

    @DeleteMapping
    public Msg deleteTruck(@RequestParam(name = "truckID",required = true) int truckID){
        return msg;
    }

    @PutMapping
    public Msg putTruck(@RequestBody Truck truck){
        return msg;
    }

    @GetMapping
    public Msg getTruck(@RequestParam(name = "number",required = true) String number){
        return msg;
    }
}
