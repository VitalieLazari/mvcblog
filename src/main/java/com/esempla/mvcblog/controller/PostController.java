package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.domain.Comment;
import com.esempla.mvcblog.domain.Post;
import com.esempla.mvcblog.domain.PostStatus;
import com.esempla.mvcblog.repository.CommentRepository;
import com.esempla.mvcblog.repository.PostRepository;
import com.esempla.mvcblog.repository.PostStatusRepository;
import com.esempla.mvcblog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/post")
public class PostController {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private PostRepository postRepo;

    @Autowired
    private PostStatusRepository postStatusRepo;

    @Autowired
    private CommentRepository commentRepo;


    @GetMapping
    public String postList(Model model) {
        model.addAttribute("posts", postRepo.findLatestPosts(new PageRequest(0, 10)));
        return "main";
    }

    @GetMapping("/view/{id}")
    public String view(@PathVariable("id") Long id, Model model) {
        Post post = postRepo.findAll().stream()
                .filter(p -> Objects.equals(p.getId(), id))
                .findFirst()
                .orElse(null);

        model.addAttribute("post", post);

        List<Comment> comments = commentRepo.findAllByPost_Id(post.getId());

        model.addAttribute("comments", comments);

        return "posts/postView";
    }

    @GetMapping("edit/{post}")
    public String postEdit(@PathVariable Post post, Model model) {
        model.addAttribute("post", post);

        model.addAttribute("statuses", postStatusRepo.findAll());
        return "posts/postEdit";
    }

    @PostMapping
    public String postSave(@RequestParam String title,
                           @RequestParam String content,
                           @RequestParam PostStatus status,
                           @RequestParam("postId") Post post,
                           Model model) {


        post.setTitle(title);
        post.setContent(content);
        post.setUpdateTime(new Date());
        post.setStatus(status);

        postRepo.save(post);
        model.addAttribute("post", post);

        return "redirect:/post/view/" + post.getId();
    }

    @GetMapping("delete/{id}")
    public String postDelete(@PathVariable("id") Long id, Model model) {

        postRepo.deleteById(id);

        model.addAttribute("posts", postRepo.findLatestPosts(new PageRequest(0, 10)));
        return "redirect:/main";
    }
}
