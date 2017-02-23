package org.lightnotes.dao;

import org.lightnotes.entity.Topic;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface TopicDao {

    Topic selectTopicByID(long topicID);

    List<Topic> selectTopicByCreator(long creatorID);

    List<Topic> selectTopicByTeam(long teamID);

    int updateTopic(Topic topic);

    int insertTopic(Topic topic);

    int deleteTopic(Topic topic);
}
