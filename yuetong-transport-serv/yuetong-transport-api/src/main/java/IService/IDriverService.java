package IService;

import beans.Driver;
import beans.Msg;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(value = "transport-dao", path = "/fleet/driver", contextId = "IDriverService")
public interface IDriverService {

    @PostMapping
    public Msg postDriver(@RequestBody Driver driver);

    @DeleteMapping
    public Msg deleteDriver(@RequestParam(name = "driverID",required = true) int driverID);

    @PutMapping
    public Msg putDriver(@RequestBody Driver driver);

    @GetMapping
    public Msg getDriver(@RequestParam(name = "name",required = true) String name);
}
