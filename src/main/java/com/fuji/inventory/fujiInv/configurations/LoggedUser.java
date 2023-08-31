package com.fuji.inventory.fujiInv.configurations;

import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionBindingListener;
import org.springframework.stereotype.Component;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

@Component
public class LoggedUser implements HttpSessionBindingListener, Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    private String username;
    private ActiveUsersStore activeUsersStore;

    public LoggedUser(String username, ActiveUsersStore activeUsersStore) {
        this.username = username;
        this.activeUsersStore = activeUsersStore;
    }

    public LoggedUser() {}


    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        List<String> users = activeUsersStore.getActiveUsers();
        LoggedUser user = (LoggedUser) event.getValue();
        if(!users.contains(user.getUsername())){
            users.add(user.getUsername());
        }
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        List<String> users = activeUsersStore.getActiveUsers();
        LoggedUser user = (LoggedUser) event.getValue();
        if (users.contains(user.getUsername())){
            users.remove(user.getUsername());
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public ActiveUsersStore getActiveUsersStore() {
        return activeUsersStore;
    }

    public void setActiveUsersStore(ActiveUsersStore activeUsersStore) {
        this.activeUsersStore = activeUsersStore;
    }
}
