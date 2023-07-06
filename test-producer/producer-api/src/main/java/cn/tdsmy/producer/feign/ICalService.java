package cn.tdsmy.producer.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "test-producer-impl", path = "/producer")
public interface ICalService {

    @GetMapping("/add")
    double add(@RequestParam("x") double x, @RequestParam("y") double y);
}