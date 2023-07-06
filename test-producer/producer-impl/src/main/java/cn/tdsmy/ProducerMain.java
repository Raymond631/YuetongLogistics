package cn.tdsmy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ProducerMain {
    public static void main(String[] args) {
        SpringApplication.run(ProducerMain.class, args);
        System.out.println("服务提供者 启动成功");
    }
}