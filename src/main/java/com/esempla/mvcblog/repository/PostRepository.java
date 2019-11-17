package com.esempla.mvcblog.repository;

import com.esempla.mvcblog.domain.Post;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {

    @Query("SELECT p FROM Post p LEFT JOIN FETCH p.user ORDER BY p.createTime DESC")
    List<Post> findLatestPosts(Pageable pageable);

    @Query("SELECT p FROM Post p LEFT JOIN FETCH p.user ORDER BY p.createTime DESC")
    List<Post> findAll();

    Iterable<Post> findByTitle(String filter);
}
