package controller;


import IService.ITruckService;
import beans.Msg;
import beans.Truck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/fleet/truck")
public class TruckController {

    @Autowired
    private ITruckService truckService;
    private Msg msg;

    @PostMapping
    public Msg postTruck(@RequestBody Truck truck){
        msg = truckService.postTruck(truck);
        return msg;
    }

    @DeleteMapping
    public Msg deleteTruck(@RequestParam(name = "truckID",required = true) int truckID){
        msg = truckService.deleteTruck(truckID);
        return msg;
    }

    @PutMapping
    public Msg putTruck(@RequestBody Truck truck){
        msg = truckService.putTruck(truck);
        return msg;
    }

    @GetMapping
    public Msg getTruck(@RequestParam(name = "number",required = true) String number){
        msg = truckService.getTruck(number);
        return msg;
    }
}
