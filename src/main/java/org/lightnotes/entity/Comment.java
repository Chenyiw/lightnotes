package org.lightnotes.entity;

import java.util.Date;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public class Comment {

    private long commentID;

    private String content;

    private long creatorID;

    private  long belongID;

    private Date time;

    private int type;

    public long getCommentID() {
        return commentID;
    }

    public void setCommentID(long commentID) {
        this.commentID = commentID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(long creatorID) {
        this.creatorID = creatorID;
    }

    public long getBelongID() {
        return belongID;
    }

    public void setBelongID(long belongID) {
        this.belongID = belongID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
