package cn.tdsmy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"cn.tdsmy"})
public class YueTongGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongGatewayApplication.class, args);
    }
}