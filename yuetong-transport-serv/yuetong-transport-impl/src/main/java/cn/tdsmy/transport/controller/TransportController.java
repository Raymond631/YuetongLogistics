package cn.tdsmy.transport.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/transport")
public class TransportController {
    @GetMapping("add")
    public double add(double x, double y) {
        return x + y;
    }
}
