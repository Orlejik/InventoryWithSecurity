package com.fuji.inventory.fujiInv.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;
    @Column(name = "username", unique = true)
    @NonNull
    private String username;
    @Column(name = "email", unique = true)
    @NonNull
    private String email;
    @Column(name = "isActive")
    private boolean isActive;

    @Column(name = "password")
    @NonNull
    private String password;
    @Column(name = "roles")
    private String roles;
    @Column(name = "permissions")
    private String permissions;
    @Column(name = "creationDate")
    @NonNull
    private String creationDate;
    @Column(name = "department")
    @NonNull
    private String department;
    @Column(name = "plant")
    @NonNull
    private String plant;

    @PrePersist
    private void init() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        creationDate = LocalDateTime.now().format(formatter);
        roles="ROLE_"+roles;
        email=email+"@eu.fujikura.com";
    }


    public List<String> getRoleList(){
        if(this.roles.length()>0){
            return Arrays.asList(this.roles.split(","));
        }
        return new ArrayList<>();
    }

    public List<String> getPermissionsList(){
        if (this.permissions.length()>0){
            return Arrays.asList(this.roles.split(","));
        }
        return new ArrayList<>();
    }

}


