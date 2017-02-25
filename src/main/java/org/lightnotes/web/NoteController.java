package org.lightnotes.web;

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
    public String getNoteByCreator(long userID, Model model){


        List<NoteDetail> list = noteService.detailNoteByCreator(userID);
        model.addAttribute("noteDetail",list);

        return "selectNote";
    }

    @RequestMapping("/limit")
    public String getNoteByLimit(long userID,Model model){
        List<NoteDetail> list = noteService.detailNoteByCreator(userID);
        model.addAttribute("noteDetail",list);
        return null;
    }



}
