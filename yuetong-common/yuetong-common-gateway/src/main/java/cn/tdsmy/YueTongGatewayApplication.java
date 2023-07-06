package cn.tdsmy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class YueTongGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongGatewayApplication.class, args);
    }
}