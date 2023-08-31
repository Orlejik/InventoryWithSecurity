package com.fuji.inventory.fujiInv.service;

import com.fuji.inventory.fujiInv.models.InvItem;
import com.fuji.inventory.fujiInv.models.Logs;
import com.fuji.inventory.fujiInv.models.User;
import com.fuji.inventory.fujiInv.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Optional;

@Service
@Component
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public Object usersModel(String username) {
        if (username != null) return userRepository.findByUsername(username);
        return userRepository.findAll();
    }

    public void deleteUser(Long id) {
        log.info("User with ID \"{}\" ({}) was deleted", id, getUserById(id));
        userRepository.delete(getUserById(id));
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public User getUserByUserName(String username) {
        return userRepository.findByUsername(username);
    }

    public boolean createUser(User user) {
        String username = user.getUsername();
        if (userRepository.findByUsername(username) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword().toLowerCase()));
        userRepository.save(user);
        log.info("Saved new user with <<{}>> name!", username);
        return true;
    }

    public User updateUser(String name){
        Optional<User> userFormDB = userRepository.getUserByUsername(name);
        User user = null;
        if (userFormDB.isPresent()){
            user = userFormDB.get();
        }else{
            throw new RuntimeException("User with name "+ name+" wa not found!!!");
        }
        return user;
    }

    public void saveUpdatedUser(User user) {
        userRepository.save(user);
        log.info("Updated new user with <<{}>> name, is active -  {} in {}!", user.getUsername(), user.isActive(), user.getPlant());
        log.info("Updated " + user);

    }
}
