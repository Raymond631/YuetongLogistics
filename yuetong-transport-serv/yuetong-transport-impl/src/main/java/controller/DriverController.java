package controller;

import IService.IDriverService;
import beans.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import beans.Driver;

@RestController
@RequestMapping("/fleet/driver")
public class DriverController {

    @Autowired
    private IDriverService driverService;
    private Msg msg;


    @PostMapping
    public Msg postDriver(@RequestBody Driver driver){
        msg = driverService.postDriver(driver);
        return msg;
    }

    @DeleteMapping
    public Msg deleteDriver(@RequestParam(name = "driverID",required = true) int driverID){
        msg = driverService.deleteDriver(driverID);
        return msg;
    }

    @PutMapping
    public Msg putDriver(@RequestBody Driver driver){
        msg = driverService.putDriver(driver);
        return msg;
    }

    @GetMapping
    public Msg getDriver(@RequestParam(name = "name",required = true) String name){
        msg = driverService.getDriver(name);
        return msg;
    }
}
