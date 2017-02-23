package org.lightnotes.service;

import org.lightnotes.dto.NoteDetail;
import org.lightnotes.entity.Note;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface NoteService {
    List<NoteDetail> getNoteByCreator(long userID);

    int editorNote(Note note);

    int createNote(Note note);

    int deleteNote(long noteID);
}
