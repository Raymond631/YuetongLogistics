package cn.tdsmy.transport;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableFeignClients(basePackages = {"cn.tdsmy"})
@EnableDiscoveryClient
@SpringBootApplication
@ComponentScan("cn.tdsmy")
public class YueTongTransportApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongTransportApplication.class, args);
        System.out.println("\n--------------------承运模块 启动成功--------------------\n");
    }
}