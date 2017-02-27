package org.lightnotes.web;

import org.lightnotes.entity.User;
import org.lightnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by Bill Chen on 2017/2/23.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/login")
    public String login(User user, Model model, HttpSession session){
        String usermail = user.getUsermail();
        String password = user.getPassword();
        user = userService.selectUser(usermail);
        if(user != null&&user.getPassword().equals(password)){
            session.setAttribute("userID",user.getUserID());
            return "redirect:/note/myNote";
        }else{
            String info = "无法登陆";
            session.setAttribute("info", info);
            return "redirect:/";
        }
    }

    @RequestMapping("/userDetail")
    public String userDetail(Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        User user = userService.selectUserByID(userID);
        model.addAttribute("user",user);

        return "userDetail";
    }

    @RequestMapping("/update")
    public String update(Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        User user = userService.selectUserByID(userID);
        model.addAttribute("user",user);
        return "updateUser";
    }

    @RequestMapping("doUpdate")
    public String doUpdate(Model model,HttpSession session){
        String info = "修改成功";
        session.setAttribute("info", info);

//        修改失败

        return "redirect:/user/userDetail";
    }

    @RequestMapping("/resetPassword")
    public String resetPassword(Model model,HttpSession session){


        return "resetPassword";
    }


    @RequestMapping("/doResetPassword")
    public String doResetPassword(Model model,HttpSession session){
        String info = "修改成功";
        session.setAttribute("info", info);

//        修改失败

        return "redirect:/user/userDetail";
    }


//    @RequestMapping(value = "/{userMail}/userByMail")
//    public String userByMail(@PathVariable("userMail") String userMail, Model model){
//        if (userMail == null && userMail.equals("")) {
//            return "redirect:/user/allUser";
//        }
//        User user = userService.selectUser(userMail);
//        if (user == null){
//            return "redirect:/user/allUser";
//        }
//        model.addAttribute("user",user);
//        return "user";
//    }
}
