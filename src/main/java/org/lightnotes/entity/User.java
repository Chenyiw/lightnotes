package org.lightnotes.entity;

/**
 * Created by Bill Chen on 2017/2/20.
 */
public class User {
    private long userID;

    private String userMail;

    private String password;

    private int type;

    private String name;

    private String gender;

    private int age;


    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getUsermail() {
        return userMail;
    }

    public void setUsermail(String usermail) {
        this.userMail = usermail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", userMail='" + userMail + '\'' +
                ", password='" + password + '\'' +
                ", type=" + type +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                '}';
    }
}
