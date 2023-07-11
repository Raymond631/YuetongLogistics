import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@EnableAutoConfiguration
@ComponentScan(basePackages = {"beans", "IService"})
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
