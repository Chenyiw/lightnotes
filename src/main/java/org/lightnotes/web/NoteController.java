package org.lightnotes.web;

import com.sun.javafx.sg.prism.NGShape;
import org.lightnotes.dto.NoteDetail;
import org.lightnotes.entity.User;
import org.lightnotes.service.NoteService;
import org.lightnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
@Controller
@RequestMapping("/note")
public class NoteController {

    @Autowired
    private NoteService noteService;
    @Autowired
    private UserService userService;

    @RequestMapping("/myNote")
    public String getNoteByCreator( Model model,HttpSession session){

        if(session.getAttribute("userID")==null) return "redirect:/";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        List<NoteDetail> list = noteService.detailNoteByCreator(userID);
        model.addAttribute("noteDetail",list);

        return "selectNote";
    }

    @RequestMapping("/limit")
    public String getNoteByLimit(String theme,int type,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        List<NoteDetail> list = noteService.selectNoteByLimit(theme,type,userID);
        model.addAttribute("noteDetail",list);
        return "selectNote";
    }

    @RequestMapping("/createNote")
    public String createNote(HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/";
        return "createNote";
    }

    @RequestMapping("/doCreateNote")
    public String doCreateNote(Model model,HttpSession session){
        String info = "创建成功";
        session.setAttribute("info", info);

//        创建失败

        return "redirect:/note/myNote";
    }




}
