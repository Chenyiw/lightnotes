package org.lightnotes.service.impl;

import org.lightnotes.dao.LabelDao;
import org.lightnotes.dao.NoteDao;
import org.lightnotes.dao.UserDao;
import org.lightnotes.dto.NoteDetail;
import org.lightnotes.entity.Label;
import org.lightnotes.entity.Note;
import org.lightnotes.entity.User;
import org.lightnotes.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
@Service
public class NoteServiceImpl implements NoteService {

    @Autowired
    private NoteDao noteDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private LabelDao labelDao;

    public List<NoteDetail> getNoteByCreator(long userID) {
        List<NoteDetail> listDetail = noteDao.detailNoteByCreator(userID);

        return listDetail;
    }

    public int editorNote(Note note) {
        return 0;
    }

    public int createNote(Note note) {
        return 0;
    }

    public int deleteNote(long noteID) {
        return 0;
    }
}
