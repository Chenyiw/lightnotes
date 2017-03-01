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

import javax.xml.soap.Detail;
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

    public List<NoteDetail> detailNoteByCreator(long userID) {
        return noteDao.detailNoteByCreator(userID);
    }

    public List<NoteDetail> selectNoteByLimit(String theme, int type,long userID) {
        theme = "%"+theme+"%";
        if(type==-1){
            return noteDao.selectNoteByTheme(theme,userID);
        }
        return  noteDao.selectNoteByThemeAndType(theme,type,userID);
    }

    public NoteDetail detailByID(long noteID) {
        return noteDao.detailByID(noteID);
    }

    public List<NoteDetail> detailNoteByEditor(long userID) {
        return noteDao.detailNoteByEditor(userID);
    }

    public List<NoteDetail> noteLimitByEditor(String theme, int type, long userID) {
        theme = "%"+theme+"%";
        if(type==-1){
            return noteDao.editorNoteByTheme(theme,userID);
        }
        return  noteDao.editorNoteByThemeAndType(theme,type,userID);
    }

    public int editorNote(Note note) {

        return noteDao.updateNote(note);
    }

    public int createNote(Note note) {
        return noteDao.insertNote(note);
    }

    public int deleteNote(long noteID) {
        return  noteDao.deleteNote(noteID);
    }
}
