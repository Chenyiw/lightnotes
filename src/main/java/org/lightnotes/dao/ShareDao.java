package org.lightnotes.dao;

import org.lightnotes.entity.Share;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface ShareDao {

    List<Share> selectShareByCreator(long creatorID);

    List<Share> selectShareByTeam(long teamID);

    List<Share> selectShareByTopic(long topicID);

    List<Share> selectShareByNote(long noteID);

    int insertShare(Share share);

    int deleteShare(long noteID,long teamID,long topicID);
}
