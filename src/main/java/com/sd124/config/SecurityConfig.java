package com.sd124.config;

//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
public class SecurityConfig {
//
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http.authorizeHttpRequests((requests) ->
//                        requests.requestMatchers("/", "/home").permitAll()
//                                .requestMatchers("/admin/**").hasRole("ADMIN").anyRequest().authenticated()
//                )
//                .formLogin((form) -> form.loginPage("/login")
//                        .defaultSuccessUrl("/", false).permitAll()
//                )
//                .logout((logout) -> logout.logoutSuccessUrl("/"));
//        return http.build();
//    }
}
