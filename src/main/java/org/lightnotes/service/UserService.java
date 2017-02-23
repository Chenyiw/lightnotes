package org.lightnotes.service;

import org.lightnotes.dao.UserDao;
import org.lightnotes.entity.User;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/20.
 */
public interface UserService {

    List<User> showAllUser();

    User selectUser(String userMail);

}
