package org.lightnotes.dao;

import org.lightnotes.entity.User;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/20.
 */
public interface UserDao {
    User selectUser(String userMail);

    List<User> showAllUser();

    User selectUserByID(long userID);

    int deleteUser(long userID);

    int insertUser(User user);

    int updateUser(User user);

}
