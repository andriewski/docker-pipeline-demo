package by.mark.dockerdemo.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/")
public class HelloController {

    @GetMapping
    public String helloWorld() {
        return "Hello, world! :)";
    }
}
