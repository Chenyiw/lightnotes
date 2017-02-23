package org.lightnotes.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.lightnotes.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Bill Chen on 2017/2/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserDaoTest {

    @Resource
    private UserDao userDao;

    @Test
    public void selectUser() throws Exception {
        String usermail = "Bill@qq.com";
        User user = userDao.selectUser(usermail);
        System.out.println(".............."+user+"..............");
    }





}