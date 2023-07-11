package api;

import beans.Msg;
import mapper.ContactMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Service
@RequestMapping("/fleet/contact")
public class ContactService {

    @Autowired
    Msg msg;
    @Autowired
    ContactMapper contactMapper;

    @PostMapping
    public Msg bind(int fkTruckID, int fkDriverID){

        boolean existence= contactMapper.findBind(fkTruckID, fkDriverID) != 0;

        if(existence){
            msg.setCode(403);
            msg.setMsg("已存在该绑定");
        }else {
            try{
                contactMapper.bind(fkTruckID, fkDriverID);
                msg.setCode(200);
                msg.setMsg("绑定成功");
            }catch (Exception e){
                e.printStackTrace();
                msg.setCode(500);
                msg.setMsg("绑定失败");
            }
        }
        return msg;
    }

    @DeleteMapping
    public Msg unbind(int fkTruckID, int fkDriverID){

        boolean existence= contactMapper.findBind(fkTruckID, fkDriverID) != 0;

        if(!existence){
            msg.setCode(403);
            msg.setMsg("该绑定不存在");
        }else {
            try{
                contactMapper.unbind(fkTruckID, fkDriverID);
                msg.setCode(200);
                msg.setMsg("解绑成功");
            }catch (Exception e){
                e.printStackTrace();
                msg.setCode(500);
                msg.setMsg("解绑失败");
            }
        }
        return msg;
    }
}
