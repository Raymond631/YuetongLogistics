package cn.tdsmy.producer.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/producer")
public class ProducerController {
    @GetMapping("/add")
    public Double add(@RequestParam(name = "x", required = false) Double x, @RequestParam("y") Double y) {
        return x + y;
    }
}
