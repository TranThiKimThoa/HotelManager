
package com.mycompany.hotelmanage.controller;

import com.mycompany.hotelmanage.entity.UserEntity;
import com.mycompany.hotelmanage.entity.UserRoleEntity;
import com.mycompany.hotelmanage.enums.UserRoleEnums;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagementController {

    @RequestMapping("/management")
    public String userPage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("name", userEntity.getName());
            model.addAttribute("address", userEntity.getAddress());
            model.addAttribute("email", userEntity.getEmail());
            for (UserRoleEntity obj : userEntity.getRole()) {
                if (obj.getRole().equals(UserRoleEnums.ROLE_EMPLOYEE)) {
                    return "employee";
                } else {
                    return "homelogin";
                }
            }
        }
        return "home";
    }
}
