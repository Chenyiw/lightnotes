package org.lightnotes.web;

import org.lightnotes.dto.NoteDetail;
import org.lightnotes.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping("/{userID}/noteDetail")
    @ResponseBody
    public List<NoteDetail> getNoteByCreator(@PathVariable("userID")long userID, Model model){
        List<NoteDetail> list = noteService.getNoteByCreator(userID);
        return list;
    }

}
