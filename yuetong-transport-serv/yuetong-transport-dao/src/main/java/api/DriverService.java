package api;

import beans.Driver;
import beans.Msg;
import mapper.DriverMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

@RestController
@Service
@RequestMapping("/fleet/driver")
public class DriverService {

    @Autowired
    Msg msg;

    @Autowired
    DriverMapper driverMapper;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @PostMapping
    public Msg postDriver(@RequestBody Driver driver){
        ArrayList<Object> list = driverMapper.getDriverById_card(driver.getIdCard());
        boolean existence = !list.isEmpty();
        if(existence){
            msg.setCode(403);
            msg.setMsg("该用户身份证已被注册");
        }else{
            try{
                driverMapper.postDriver(driver);
                msg.setCode(200);
                msg.setMsg("注册成功");
            }catch (Exception e){
                e.printStackTrace();
                msg.setCode(500);
                msg.setMsg("注册失败");
            }
        }
        return msg;
    }

    @DeleteMapping
    public Msg deleteDriver(@RequestParam(name = "driverID",required = true) int driverID){
        try{
            int res = driverMapper.deleteDriver(driverID);
            if (res==1){
                msg.setCode(200);
                msg.setMsg("删除成功");
            }else{
                msg.setCode(500);
                msg.setMsg("未找到该用户");
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setCode(500);
            msg.setMsg("删除失败");
        }
        return msg;
    }

    @PutMapping
    public Msg putDriver(@RequestBody Driver driver){
        try{
            int res = driverMapper.putDriver(driver);
            if (res==1){
                msg.setCode(200);
                msg.setMsg("修改成功");
            }else{
                msg.setCode(500);
                msg.setMsg("未找到该用户");
            }
        }catch (Exception e){
            e.printStackTrace();
            msg.setCode(500);
            msg.setMsg("修改失败");
        }
        return msg;
    }

    @GetMapping
    public Msg getDriver(@RequestParam(name = "name",required = true) String name){
        ArrayList<Object> list = driverMapper.getDriverByName(name);
        boolean existence = !list.isEmpty();
        if(!existence){
            msg.setCode(403);
            msg.setMsg("未找到该用户");
        }else{
            msg.setRows(list);
            msg.setCode(200);
            msg.setMsg("查询成功");
        }
        return msg;
    }
}
