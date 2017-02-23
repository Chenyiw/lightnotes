package org.lightnotes.entity;

import java.util.Date;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public class Share {

    private long noteID;

    private long teamID;

    private long topicID;

    private long creatorID;

    private Date time;

    public long getNoteID() {
        return noteID;
    }

    public void setNoteID(long noteID) {
        this.noteID = noteID;
    }

    public long getTeamID() {
        return teamID;
    }

    public void setTeamID(long teamID) {
        this.teamID = teamID;
    }

    public long getTopicID() {
        return topicID;
    }

    public void setTopicID(long topicID) {
        this.topicID = topicID;
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
}
