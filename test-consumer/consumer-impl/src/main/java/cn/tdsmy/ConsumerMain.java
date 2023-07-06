package cn.tdsmy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"cn.tdsmy"})
public class ConsumerMain {
    public static void main(String[] args) {
        SpringApplication.run(ConsumerMain.class, args);
        System.out.println("服务消费者 启动成功");
    }
}