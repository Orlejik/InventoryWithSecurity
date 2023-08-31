package com.fuji.inventory.fujiInv.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .csrf().disable()
                .authorizeHttpRequests(auth -> {
                            try {
                                auth
                                        //   -------------------- Access to all API
                                        .requestMatchers(HttpMethod.GET, "/**", "/item/create", "/charts", "/item/{id}/update").hasAnyRole("ROLE_ADMIN", "ROLE_USER")
                                        .requestMatchers(HttpMethod.POST, "/item/{id}/update, ").hasAnyRole("ROLE_ADMIN", "ROLE_USER")
                                        //   -------------------- Access for API ASSETS
                                        .requestMatchers(HttpMethod.GET, "/users/**", "/assets-add/**").hasRole("ROLE_ADMIN")
                                        .requestMatchers(HttpMethod.POST, "/assets/create", "/users/**","/users/create", "/user/{username}/update").hasRole("ROLE_ADMIN")
                                        .requestMatchers(HttpMethod.DELETE, "/assets/delete/{id}", "/users/delete/{id}", "/item/delete/{id}").hasRole("ROLE_ADMIN")
                                        .anyRequest()
                                        .authenticated()
                                        .and()
                                        .userDetailsService(customUserDetailsService);
                            } catch (Exception e) {
                                throw new RuntimeException(e);
                            }
                        }
                )
                .formLogin()
                .and()
                .exceptionHandling()
                .accessDeniedPage("/access-dennied")
                .and()
                .authenticationProvider(authenticationProvider())
                .build();
    }

    @Bean
    AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(this.customUserDetailsService);
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setHideUserNotFoundExceptions(true);
        return daoAuthenticationProvider;
    }
}
