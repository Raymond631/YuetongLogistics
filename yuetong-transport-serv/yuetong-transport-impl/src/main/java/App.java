import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableAutoConfiguration
@ComponentScan(basePackages = {"beans","controller", "service", "IService"})
@EnableFeignClients(basePackages = {"IService"})
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class,args);
    }
}
