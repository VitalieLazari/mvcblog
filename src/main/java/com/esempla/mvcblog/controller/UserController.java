package com.esempla.mvcblog.controller;

import com.esempla.mvcblog.domain.Role;
import com.esempla.mvcblog.domain.User;
import com.esempla.mvcblog.domain.UserStatus;
import com.esempla.mvcblog.repository.UserRepository;
import com.esempla.mvcblog.repository.UserStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepository userRepo;

    @Autowired
    private UserStatusRepository userStatusRepo;

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userRepo.findAll());
        return "users/userList";
    }

    @GetMapping("/view/{id}")
    public String userView(@PathVariable("id") Long id, Model model) {
        User user = userRepo.findAll().stream()
                .filter(u -> Objects.equals(u.getId(), id))
                .findFirst()
                .orElse(null);

        model.addAttribute("userDetails", user);

        String status = user.getStatus().getStatus();

        model.addAttribute("status", status);

        model.addAttribute("roles", Role.values());

        return "users/userView";
    }

    @GetMapping("edit/{user}")
    public String userEdit(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        model.addAttribute("statuses", userStatusRepo.findAll());

        return "users/userEdit";
    }

    @PostMapping
    public String userSave(@RequestParam String username,
                           @RequestParam String firstName,
                           @RequestParam String lastName,
                           @RequestParam String password,
                           @RequestParam String email,
                           @RequestParam UserStatus status,
                           @RequestParam Map<String, String> form,
                           @RequestParam("userId") User user) {

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }


        user.setUsername(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setEmail(email);
        user.setStatus(status);

        userRepo.save(user);
        return "redirect:/user";
    }

    @GetMapping("delete/{id}")
    public String userDelete(@PathVariable("id") Long id, Model model) {

        userRepo.deleteById(id);

        model.addAttribute("users", userRepo.findAll());
        return "redirect:/user";
    }
}
