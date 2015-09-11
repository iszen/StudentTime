package ro.ebs.studenttime.conf;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Created by Bella on 9/8/2015.
 */
@Configuration
@ComponentScan("ro.ebs.studenttime")
@EnableWebMvc
@PropertySource(value = { "classpath:application.properties" })
public class AppConfig {

}
