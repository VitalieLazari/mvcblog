package com.esempla.mvcblog.service;

import com.esempla.mvcblog.domain.Role;
import com.esempla.mvcblog.domain.User;
import com.esempla.mvcblog.repository.UserRepository;
import com.esempla.mvcblog.repository.UserStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private UserStatusRepository userStatusRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setStatus(userStatusRepo.findByStatus("INACTIVE"));
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);

        return true;
    }
}
