package api;

import beans.Msg;
import beans.Truck;
import beans.TruckTeam;
import mapper.TruckMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@Service
@RequestMapping("/fleet/truck")
public class TruckService {

    @Autowired
    Msg msg;

    @Autowired
    TruckMapper truckMapper;

    @PostMapping
    public Msg postTruck(@RequestBody Truck truck){
        ArrayList<Object> list = truckMapper.getTruck(truck.getNumber());
        boolean existence = !list.isEmpty();
        if(existence){
            msg.setCode(403);
            msg.setMsg("该车牌号已被注册");
        }else{
            try{
                truckMapper.postTruck(truck);
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
    public Msg deleteTruck(@RequestParam(name = "truckID",required = true) int truckID){
        try{
            int res = truckMapper.deleteTruck(truckID);
            if (res==1){
                msg.setCode(200);
                msg.setMsg("删除成功");
            }else{
                msg.setCode(500);
                msg.setMsg("未找到车辆");
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setCode(500);
            msg.setMsg("删除失败");
        }
        return msg;
    }

    @PutMapping
    public Msg putTruck(@RequestBody Truck truck){
        try{
            int res = truckMapper.putTruck(truck);
            if (res==1){
                msg.setCode(200);
                msg.setMsg("修改成功");
            }else{
                msg.setCode(500);
                msg.setMsg("未找到该车辆");
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setCode(500);
            msg.setMsg("修改失败");
        }
        return msg;
    }

    @GetMapping
    public Msg getTruck(@RequestParam(name = "number",required = true) String number){
        ArrayList<Object> list = truckMapper.getTruck(number);
        boolean existence = !list.isEmpty();
        if(!existence){
            msg.setCode(403);
            msg.setMsg("未找到该车辆");
        }else{
            msg.setRows(list);
            msg.setCode(200);
            msg.setMsg("查询成功");
        }
        return msg;
    }
}
