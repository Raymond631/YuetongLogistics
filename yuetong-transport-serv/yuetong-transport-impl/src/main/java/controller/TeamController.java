package controller;

import IService.ITeamService;
import beans.Msg;
import beans.TruckTeam;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/fleet/team")
public class TeamController {

    @Autowired
    private ITeamService teamService;
    private Msg msg;

    @PostMapping
    public Msg postTeam(@RequestBody TruckTeam truckTeam) {
        msg = teamService.postTeam(truckTeam);
        return msg;
    }

    @DeleteMapping
    public Msg deleteTeam(@RequestParam(name = "teamID",required = true) int teamID) {
        msg = teamService.deleteTeam(teamID);
        return msg;
    }

    @PutMapping
    public Msg putTeam(@RequestBody TruckTeam truckTeam){
        msg = teamService.putTeam(truckTeam);
        return msg;
    }

    @GetMapping
    public Msg getTeam(@RequestParam(name = "teamName",required = true) String teamName){
        msg = teamService.getTeam(teamName);
        return msg;
    }

}
