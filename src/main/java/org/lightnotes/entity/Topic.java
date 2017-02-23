package org.lightnotes.entity;

import java.util.Date;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public class Topic {

    private long topicID;

    private String theme;

    private String description;

    private long creatorID;

    private Date time;

    private long teamID;

    public long getTopicID() {
        return topicID;
    }

    public void setTopicID(long topicID) {
        this.topicID = topicID;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public long getTeamID() {
        return teamID;
    }

    public void setTeamID(long teamID) {
        this.teamID = teamID;
    }
}
