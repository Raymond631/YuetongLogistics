package cn.tdsmy.producer.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/producer")
public class ProducerController {
    @GetMapping("/add")
    public double add(@RequestParam double x, @RequestParam double y) {
        return x + y;
    }
}
