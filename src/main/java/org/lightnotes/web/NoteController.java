package org.lightnotes.web;

import com.sun.javafx.sg.prism.NGShape;
import org.lightnotes.dto.NoteDetail;
import org.lightnotes.entity.Note;
import org.lightnotes.entity.User;
import org.lightnotes.service.NoteService;
import org.lightnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/myNote")
    public String getNoteByCreator( Model model,HttpSession session){

        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        List<NoteDetail> list = noteService.detailNoteByCreator(userID);
        model.addAttribute("noteDetail",list);

        return "selectNote";
    }

    @RequestMapping("/limit")
    public String getNoteByLimit(String theme,int type,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        List<NoteDetail> list = noteService.selectNoteByLimit(theme,type,userID);
        model.addAttribute("noteDetail",list);
        return "selectNote";
    }

    @RequestMapping("/createNote")
    public String createNote(HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        return "createNote";
    }

    @RequestMapping("/doCreateNote")
    public String doCreateNote(Model model,HttpSession session){
        String info = "创建成功";
        session.setAttribute("info", info);

//        创建失败

        return "redirect:/note/myNote";
    }

    @RequestMapping("/showNote")
    public String showNote(long noteID,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        NoteDetail noteDetail = noteService.detailByID(noteID);
        model.addAttribute("noteDetail",noteDetail);
        return "showNote";
    }

    @RequestMapping("/showNoteEditor")
    public String showNoteEditor(long noteID,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        NoteDetail noteDetail = noteService.detailByID(noteID);
        model.addAttribute("noteDetail",noteDetail);
        return "showNoteEditor";
    }

    @RequestMapping("/updateNote")
    public String updateNote(long noteID,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        NoteDetail noteDetail = noteService.detailByID(noteID);
        model.addAttribute("noteDetail",noteDetail);
        return "updateNote";
    }

    @RequestMapping("/doUpdate")
    public String doUpdate(Note note,Model model, HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        note.setEditorID(Long.valueOf(session.getAttribute("userID").toString()));
        noteService.editorNote(note);
        String info = "修改成功";
        session.setAttribute("info", info);
        System.out.println("......................................."+note);

//        修改失败

        return "redirect:/note/myNote";
    }

    @RequestMapping("/updateNoteEditor")
    public String updateNoteEditor(long noteID,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        NoteDetail noteDetail = noteService.detailByID(noteID);
        model.addAttribute("noteDetail",noteDetail);
        return "updateNoteEditor";
    }

    @RequestMapping("/doUpdateEditor")
    public String doUpdateEditor(Model model,HttpSession session){
        String info = "修改成功";
        session.setAttribute("info", info);

//        修改失败

        return "redirect:/note/noteByEditor";
    }

    @RequestMapping("/deleteNote")
    public String deleteNote(long noteID,Model model,HttpSession session){
        noteService.deleteNote(noteID);
        String info = "删除成功";
        session.setAttribute("info", info);
        return "redirect:/note/myNote";
    }

    @RequestMapping("/noteByEditor")
    public String noteByEditor(Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        List<NoteDetail> list = noteService.detailNoteByEditor(userID);
        model.addAttribute("noteDetail",list);

        return "noteByEditor";
    }

    @RequestMapping("/limitByEditor")
    public String limitByEditor(String theme,int type,Model model,HttpSession session){
        if(session.getAttribute("userID")==null) return "redirect:/user/loginView";
        Long userID = Long.valueOf(session.getAttribute("userID").toString());
        List<NoteDetail> list = noteService.noteLimitByEditor(theme,type,userID);
        model.addAttribute("noteDetail",list);
        return "noteByEditor";
    }






}
