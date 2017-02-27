package org.lightnotes.web;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.lightnotes.entity.User;
import org.lightnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Bill Chen on 2017/2/23.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/loginView")
    public String loginView(Model model, HttpSession session){

            return "login";
    }

    @RequestMapping(value = "/login")
    public String login(User user, Model model, HttpSession session){
        String usermail = user.getUsermail();
        String password = user.getPassword();
        user = userService.selectUser(usermail);
        if(user.getType() == 2) {
            String info = "此用户为管理员";
            session.setAttribute("info",info);
            return "adminLogin";
        }
        if (user == null){
            String info = "未找到用户";
            session.setAttribute("info", info);
            return "redirect:/";
        }
        if(user.getPassword().equals(password)){
            session.setAttribute("userID",user.getUserID());
            return "redirect:/note/myNote";
        }else{
            String info = "密码错误";
            session.setAttribute("info", info);
            return "redirect:/";
        }
    }

    @RequestMapping("/userDetail")
    public String userDetail(Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        User user = userService.selectUserByID(userID);
        model.addAttribute("user",user);

        return "userDetail";
    }

    @RequestMapping("/update")
    public String update(Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
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

    @RequestMapping("/logout")
    public String logout(Model model,HttpSession session){
        session.removeAttribute("userID");
        return "redirect:/";
    }

    @RequestMapping("/signUp")
    public String signUp(Model model,HttpSession session){
        return "signUp";
    }

    @RequestMapping("/doSignUp")
    public String doSignUp(Model model,HttpSession session){
        String info = "注册成功";
        session.setAttribute("info", info);

//        修改失败

        return "redirect:/";
    }

    @RequestMapping("/adminView")
    public String adminView(Model model,HttpSession session){
        return "adminLogin";
    }

    @RequestMapping("/adminLogin")
    public String adminLogin(User user, Model model, HttpSession session){
        String usermail = user.getUsermail();
        String password = user.getPassword();
        user = userService.selectUser(usermail);
        if(user.getType() == 1) {
            String info = "此用户不是管理员";
            session.setAttribute("info",info);
            return "login";
        }
        if (user == null){
            String info = "未找到用户";
            session.setAttribute("info", info);
            return "redirect:/";
        }
        if(user.getPassword().equals(password)){
            session.setAttribute("userID",user.getUserID());
            return "redirect:/user/adminUser";
        }else{
            String info = "密码错误";
            session.setAttribute("info", info);
            return "redirect:/";
        }
    }

    @RequestMapping("/adminUser")
    public String adminUser(Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        List<User> user = userService.showAllUser();
        System.out.println(user);
        model.addAttribute("user",user);
        return "adminUser";
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
