package com.esempla.mvcblog.repository;

import com.esempla.mvcblog.domain.PostStatus;
import org.springframework.data.repository.CrudRepository;

public interface PostStatusRepository extends CrudRepository<PostStatus, Long> {
    PostStatus findByStatus(String status);
}
