
package com.mycompany.hotelmanage.controller;


import com.mycompany.hotelmanage.entity.UserEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/admin/")
public class AdminController {

    @RequestMapping("/admin-page")
    public String showUserAdmin(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserEntity) {
            UserEntity userEntity = (UserEntity) (principal);
            model.addAttribute("name", userEntity.getName());
            model.addAttribute("address", userEntity.getAddress());
            model.addAttribute("email", userEntity.getName());
        }
        model.addAttribute("title", "Spring Security Hello World");
        model.addAttribute("message", "This is page admin!");
        return "homelogin";
    }

}
