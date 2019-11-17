package com.esempla.mvcblog.repository;

import com.esempla.mvcblog.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    void deleteById(Long id);
}
