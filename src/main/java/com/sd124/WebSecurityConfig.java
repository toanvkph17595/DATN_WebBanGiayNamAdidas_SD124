package com.sd124;

import com.sd124.service.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

import static org.springframework.security.web.util.matcher.AntPathRequestMatcher.antMatcher;

@Configuration
@EnableWebSecurity
//@EnableWebMvc
public class WebSecurityConfig {
    @Autowired
    UserDetailsService userDetailService;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    /*
    @Bean
    MvcRequestMatcher.Builder mvc(HandlerMappingIntrospector introspector){
        return new MvcRequestMatcher.Builder(introspector).servletPath("/views");
    }*/

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, HandlerMappingIntrospector introspector) throws Exception {
        /*
        http.authorizeHttpRequests((authz) -> authz
                .requestMatchers("/home").authenticated()
//                        .requestMatchers(mvc.pattern("/admin/**")).hasRole("ADMIN")
                        .anyRequest().permitAll());*/
        /*
        MvcRequestMatcher.Builder mvc = new MvcRequestMatcher.Builder(introspector);
        http.authorizeHttpRequests((authz) -> authz

                //.requestMatchers(mvc.pattern("/admin/**")).hasRole("ADMIN")
                //.requestMatchers(mvc.pattern("/staff/**")).hasRole("STAFF")
                .anyRequest().permitAll());
        */
        http.csrf().disable().cors().disable();
        http.authorizeHttpRequests()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/staff/**").hasRole("STAFF")
                        .anyRequest().permitAll();
        http.formLogin().
                loginPage("/login")
                .defaultSuccessUrl("/", false)
                .permitAll();

        http.logout().logoutUrl("/logout").logoutSuccessUrl("/");
        return http.build();
    }
}
