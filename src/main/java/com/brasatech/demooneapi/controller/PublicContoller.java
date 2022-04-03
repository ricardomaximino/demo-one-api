package com.brasatech.demooneapi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/public")
public class PublicContoller {

    @GetMapping("/one")
    public String one(){
        return "Public One";
    }
    
    @GetMapping("/two")
    public String two(){
        return "Public Two";
    }
    
}
