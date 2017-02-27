package org.lightnotes.service;

import org.lightnotes.dto.NoteDetail;
import org.lightnotes.entity.Note;

import javax.xml.soap.Detail;
import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface NoteService {
    List<NoteDetail> getNoteByCreator(long userID);

    List<NoteDetail> detailNoteByCreator(long userID);

    List<NoteDetail> selectNoteByLimit(String theme,int type,long userID);

    NoteDetail detailByID(long noteID);

    List<NoteDetail> detailNoteByEditor(long userID);

    List<NoteDetail> noteLimitByEditor(String theme,int type,long userID);

    int editorNote(Note note);

    int createNote(Note note);

    int deleteNote(long noteID);
}
