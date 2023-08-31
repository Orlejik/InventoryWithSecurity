package com.fuji.inventory.fujiInv.repositories;


import com.fuji.inventory.fujiInv.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findById(Long id);
    User findByUsername(String username);
    Optional<User> getUserByUsername(String name);

}
