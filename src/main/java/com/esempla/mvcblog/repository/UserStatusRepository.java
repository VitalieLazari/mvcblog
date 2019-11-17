package com.esempla.mvcblog.repository;

import com.esempla.mvcblog.domain.UserStatus;
import org.springframework.data.repository.CrudRepository;

public interface UserStatusRepository extends CrudRepository<UserStatus, Long> {
    UserStatus findByStatus(String status);
}
