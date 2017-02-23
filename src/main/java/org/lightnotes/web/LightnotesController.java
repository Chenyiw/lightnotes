package org.lightnotes.web;

import org.lightnotes.entity.User;
import org.lightnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/20.
 */
@Controller
@RequestMapping("/user")
public class LightnotesController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/allUser",method = RequestMethod.GET)
    @ResponseBody
    public List<User> allUser(){
        List<User> list = userService.showAllUser();

        return list;
    }

    @RequestMapping(value = "/{userMail}/userByMail")
    public String userByMail(@PathVariable("userMail") String userMail, Model model){
       if (userMail == null && userMail.equals("")) {
           return "redirect:/user/allUser";
       }
        User user = userService.selectUser(userMail);
        if (user == null){
            return "redirect:/user/allUser";
        }
        model.addAttribute("user",user);
        return "user";
    }

}
