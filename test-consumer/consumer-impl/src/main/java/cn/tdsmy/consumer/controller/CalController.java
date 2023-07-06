package cn.tdsmy.consumer.controller;

import cn.tdsmy.producer.feign.ICalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/consumer")
public class CalController {
    @Autowired
    private ICalService iCalService;

    @GetMapping("/add")
    public double add(@RequestParam("x") double x, @RequestParam("y") double y) {
        return iCalService.add(x, y);
    }
}