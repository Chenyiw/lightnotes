package org.lightnotes.entity;

import java.util.Date;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public class Organization {

    private long userID;

    private long teanmID;

    private Date time;

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public long getTeanmID() {
        return teanmID;
    }

    public void setTeanmID(long teanmID) {
        this.teanmID = teanmID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
