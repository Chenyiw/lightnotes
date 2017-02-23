package org.lightnotes.dao;

import org.lightnotes.dto.NoteDetail;
import org.lightnotes.entity.Note;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface NoteDao {

    List<Note> selectNoteByCreator(long creatorID);

    List<NoteDetail> detailNoteByCreator(long creatorID);

    List<Note> selectNoteByEditor(long editorID);

    List<Note> selectNoteBy(long labelID);

    List<Note> selectNoteByTheme(String theme);

    Note selectNoteByID(long noteID);

    int updateNote(Note note);

    int insertNote(Note note);

    int deleteNote(long noteID);

}
