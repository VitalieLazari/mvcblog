package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.repository.PostStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/postStatus")
@PreAuthorize("hasAuthority('ADMIN')")
public class PostStatusController {

    @Autowired
    private PostStatusRepository postStatusRepo;

    @GetMapping
    public String statuses(Model model) {
        model.addAttribute("statuses", postStatusRepo.findAll());
        return "posts/postStatuses";
    }
}
