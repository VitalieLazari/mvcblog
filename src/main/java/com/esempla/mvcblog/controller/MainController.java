package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.domain.Post;
import com.esempla.mvcblog.domain.User;
import com.esempla.mvcblog.repository.PostRepository;
import com.esempla.mvcblog.repository.PostStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

    @Autowired
    private PostRepository postRepo;

    @Autowired
    private PostStatusRepository postStatusRepo;

    @GetMapping("/")
    public String greeting(Model model) {
        model.addAttribute("posts", postRepo.findLatestPosts(new PageRequest(0, 3)));
        return "index";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Post> posts;

        if (filter != null && !filter.isEmpty()) {
            posts = postRepo.findByTitle(filter);
        } else {
            posts = postRepo.findLatestPosts(new PageRequest(0, 10));
        }
        model.addAttribute("posts", posts);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(@AuthenticationPrincipal User user,
                      @RequestParam String title,
                      @RequestParam String content,
                      Model model) {
        Post post = new Post(title, content, user);

        post.setStatus(postStatusRepo.findByStatus("PUBLISHED"));
        postRepo.save(post);

        Iterable<Post> posts = postRepo.findAll();
        model.addAttribute("posts", posts);

        return "main";
    }
}
