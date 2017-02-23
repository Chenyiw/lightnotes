package org.lightnotes.entity;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public class Label {

    private long labelID;

    private String name;

    private int level;

    private long creatorID;

    private long previousID;

    public long getLabelID() {
        return labelID;
    }

    public void setLabelID(long labelID) {
        this.labelID = labelID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public long getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(long creatorID) {
        this.creatorID = creatorID;
    }

    public long getPreviousID() {
        return previousID;
    }

    public void setPreviousID(long previousID) {
        this.previousID = previousID;
    }


}
