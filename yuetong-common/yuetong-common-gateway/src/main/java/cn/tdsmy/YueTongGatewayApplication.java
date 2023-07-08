package cn.tdsmy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"cn.tdsmy"})
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class YueTongGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongGatewayApplication.class, args);
    }
}