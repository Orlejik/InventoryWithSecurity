package com.fuji.inventory.fujiInv.configurations;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ActiveUsersStore {
    public List<String> activeUsers;

    public ActiveUsersStore(){
        activeUsers =new ArrayList<>();
    }

//    @Bean
//    public ActiveUsersStore activeUsersStore(){
//        return new ActiveUsersStore();
//    }

    public List<String> getActiveUsers() {
        return activeUsers;
    }

    public void setActiveUsers(List<String> activeUsers) {
        this.activeUsers = activeUsers;
    }
}
