package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.repository.UserStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userStatus")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserStatusController {

    @Autowired
    private UserStatusRepository userStatusRepo;

    @GetMapping
    public String statuses(Model model) {
        model.addAttribute("statuses", userStatusRepo.findAll());
        return "users/userStatuses";
    }
}
