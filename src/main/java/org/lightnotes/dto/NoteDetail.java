package org.lightnotes.dto;

import org.apache.maven.plugins.annotations.Component;
import org.lightnotes.entity.Label;
import org.lightnotes.entity.Note;
import org.lightnotes.entity.User;

import java.util.Date;


/**
 * Created by Bill Chen on 2017/2/21.
 */
public class NoteDetail {
    private long noteID;

    private int type;

    private String theme;

    private String content;

    private String editor;

    private String creator;

    private Date time;


    public long getNoteID() {
        return noteID;
    }

    public void setNoteID(long noteID) {
        this.noteID = noteID;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

}
