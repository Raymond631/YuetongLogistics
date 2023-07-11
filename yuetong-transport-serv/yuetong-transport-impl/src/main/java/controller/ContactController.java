package controller;

import beans.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import IService.IContactService;

@RestController
@RequestMapping("/fleet/contact")
public class ContactController {


    @Autowired
    private IContactService contactService;
    private Msg msg;


    @PostMapping
    public Msg bind(@RequestParam(name = "fkTruckID",required = true) int fkTruckID,
                    @RequestParam(name = "fkDriverID",required = true) int fkDriverID){
        msg = contactService.bind(fkTruckID, fkDriverID);
        return msg;
    }

    @DeleteMapping
    public Msg unBind(@RequestParam(name = "fkTruckID",required = true) int fkTruckID,
                         @RequestParam(name = "fkDriverID",required = true) int fkDriverID){
        msg = contactService.unbind(fkTruckID, fkDriverID);
        return msg;
    }


    @GetMapping
    public String test(){
        return "testt";
    }
}
