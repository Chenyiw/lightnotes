package org.lightnotes.dao;

import org.lightnotes.entity.Comment;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface CommentDao {

    List<Comment> selectCommentByBelong(long belongID);

    List<Comment> selectCommentByCreator(long creatorID);

    Comment selectCommentByID(long commentID);

    int insertComment(Comment comment);

    int deleteComment(long commentID);


}
