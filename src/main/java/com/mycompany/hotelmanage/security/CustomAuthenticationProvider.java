
package com.mycompany.hotelmanage.security;


import com.mycompany.hotelmanage.entity.UserEntity;
import com.mycompany.hotelmanage.entity.UserRoleEntity;
import com.mycompany.hotelmanage.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;


@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String email = a.getName();
        String password = a.getCredentials().toString();
        UserEntity userEntity = userService.findByEmailAndPassword(email, password);
        if (userEntity != null) {
            List<GrantedAuthority> authorities = new ArrayList<>();
            
            for (UserRoleEntity role : userEntity.getRole()) {
                String roleName = role.getRole().toString();
                authorities.add(new SimpleGrantedAuthority(roleName));
            }
            return new UsernamePasswordAuthenticationToken(
                    userEntity, email, authorities);
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}
