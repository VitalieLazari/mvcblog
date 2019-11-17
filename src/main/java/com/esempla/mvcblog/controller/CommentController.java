package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.domain.Comment;
import com.esempla.mvcblog.domain.Post;
import com.esempla.mvcblog.domain.User;
import com.esempla.mvcblog.repository.CommentRepository;
import com.esempla.mvcblog.repository.PostRepository;
import com.esempla.mvcblog.repository.PostStatusRepository;
import com.esempla.mvcblog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private PostRepository postRepo;

    @Autowired
    private PostStatusRepository postStatusRepo;

    @Autowired
    private CommentRepository commentRepo;


    @PostMapping("/create")
    public String commentSave(@RequestParam String content,
                              @RequestParam String username,
                              @RequestParam("postId") Post post,
                              Model model) {

        User user = userRepo.findByUsername(username);

        Comment comment = new Comment(content, post, user);

        commentRepo.save(comment);
        model.addAttribute("post", post);

        return "redirect:/post/view/" + post.getId();
    }

    @GetMapping("delete/{id}")
    public String commentDelete(@PathVariable("id") Long id, Model model) {

        commentRepo.deleteById(id);

        model.addAttribute("posts", postRepo.findLatestPosts(new PageRequest(0, 10)));
        return "redirect:/main";
    }
}
