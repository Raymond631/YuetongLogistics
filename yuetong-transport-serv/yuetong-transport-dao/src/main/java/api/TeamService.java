package api;

import beans.Msg;
import beans.TruckTeam;
import mapper.TeamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@Service
@RequestMapping("/fleet/team")
public class TeamService {

    @Autowired
    Msg msg;

    @Autowired
    TeamMapper teamMapper;

    @PostMapping
    public Msg postTeam(@RequestBody TruckTeam truckTeam){
        ArrayList<Object> list = teamMapper.getTeam(truckTeam.getTeamName());
        boolean existence = !list.isEmpty();
        if(existence){
            msg.setCode(403);
            msg.setMsg("该车队名称已被注册");
        }else{
            try{
                teamMapper.postTeam(truckTeam);
                msg.setCode(200);
                msg.setMsg("录入成功");
            }catch (Exception e){
                e.printStackTrace();
                msg.setCode(500);
                msg.setMsg("录入失败");
            }
        }
        return msg;
    }

    @DeleteMapping
    public Msg deleteTeam(@RequestParam(name = "teamID",required = true) int teamID){
        try{
            int res = teamMapper.deleteTeam(teamID);
            if (res==1){
                msg.setCode(200);
                msg.setMsg("删除成功");
            }else{
                msg.setCode(500);
                msg.setMsg("未找到车队");
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setCode(500);
            msg.setMsg("删除失败");
        }
        return msg;
    }

    @PutMapping
    public Msg putTeam(@RequestBody TruckTeam truckTeam){
        try{
            int res = teamMapper.putTeam(truckTeam);
            if (res==1){
                msg.setCode(200);
                msg.setMsg("修改成功");
            }else{
                msg.setCode(500);
                msg.setMsg("未找到该车队");
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setCode(500);
            msg.setMsg("修改失败");
        }
        return msg;
    }

    @GetMapping
    public Msg getTeam(@RequestParam(name = "teamName",required = true) String teamName){
        ArrayList<Object> list = teamMapper.getTeam(teamName);
        boolean existence = !list.isEmpty();
        if(!existence){
            msg.setCode(403);
            msg.setMsg("未找到该车队");
        }else{
            msg.setRows(list);
            msg.setCode(200);
            msg.setMsg("查询成功");
        }
        return msg;
    }

}
