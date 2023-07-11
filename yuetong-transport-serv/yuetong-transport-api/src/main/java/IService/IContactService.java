package IService;

import beans.Msg;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "transport-dao", path = "/fleet/contact", contextId = "IContactService")
public interface IContactService {

    @PostMapping
    public Msg bind(@RequestParam("fkTruckID") int fkTruckID,
                    @RequestParam("fkDriverID") int fkDriverID);

    @DeleteMapping
    public Msg unbind(@RequestParam("fkTruckID") int fkTruckID,
                    @RequestParam("fkDriverID") int fkDriverID);
}
