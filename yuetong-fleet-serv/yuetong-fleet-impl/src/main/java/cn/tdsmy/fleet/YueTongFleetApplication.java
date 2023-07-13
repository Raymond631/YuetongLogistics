package cn.tdsmy.fleet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableFeignClients(basePackages = {"cn.tdsmy"})
@EnableDiscoveryClient
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@ComponentScan("cn.tdsmy")
public class YueTongFleetApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongFleetApplication.class, args);
        System.out.println("\n--------------------车队管理模块 启动成功--------------------\n");
    }
}