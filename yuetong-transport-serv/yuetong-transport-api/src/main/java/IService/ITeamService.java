package IService;

import beans.Msg;
import beans.TruckTeam;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(value = "transport-dao", path = "/fleet/team", contextId = "ITeamService")
public interface ITeamService {

    @PostMapping
    public Msg postTeam(@RequestBody TruckTeam truckTeam);

    @DeleteMapping
    public Msg deleteTeam(@RequestParam(name = "teamID",required = true) int teamID);

    @PutMapping
    public Msg putTeam(@RequestBody TruckTeam truckTeam);

    @GetMapping
    public Msg getTeam(@RequestParam(name = "teamName",required = true) String teamName);
}
