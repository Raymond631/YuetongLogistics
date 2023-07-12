package cn.tdsmy.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"cn.tdsmy"})
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@ComponentScan("cn.tdsmy")
public class YueTongGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongGatewayApplication.class, args);
        System.out.println("\n--------------------网关 启动成功--------------------\n");
    }
}