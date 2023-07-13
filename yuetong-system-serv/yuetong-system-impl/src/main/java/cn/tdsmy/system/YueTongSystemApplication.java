package cn.tdsmy.system;

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
public class YueTongSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(YueTongSystemApplication.class, args);
        System.out.println("\n--------------------系统管理模块 启动成功--------------------\n");
    }
}