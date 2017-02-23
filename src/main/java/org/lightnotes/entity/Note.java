package org.lightnotes.entity;

import java.util.Date;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public class Note {

    private long noteID;

    private int type;

    private String theme;

    private String content;

    private long editorID;

    private long creatorID;

    private Date time;

    private long labelID;

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

    public long getEditorID() {
        return editorID;
    }

    public void setEditorID(long editorID) {
        this.editorID = editorID;
    }

    public long getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(long creatorID) {
        this.creatorID = creatorID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public long getLabelID() {
        return labelID;
    }

    public void setLabelID(long labelID) {
        this.labelID = labelID;
    }
}
