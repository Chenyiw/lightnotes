package org.lightnotes.service.impl;

import org.lightnotes.dao.UserDao;
import org.lightnotes.entity.User;
import org.lightnotes.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/20.
 */

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    //@Transactional  事务标签
    public List<User> showAllUser() {
        return userDao.showAllUser();
    }

    public User selectUser(String userMail) {
        return userDao.selectUser(userMail);
    }

    public User selectUserByID(long userID) {
        return userDao.selectUserByID(userID);
    }

    public int createUser(User user) {
        return userDao.insertUser(user);
    }
}
