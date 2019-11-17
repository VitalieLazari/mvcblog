package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.domain.User;
import com.esempla.mvcblog.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("message", null);
        return "register";
    }

    @PostMapping("/register")
    public String addUser(User user, Model model) {
        if (!userService.addUser(user)) {
            model.addAttribute("message", "User exists");
            return "register";
        }

        return "redirect:/login";
    }
}
