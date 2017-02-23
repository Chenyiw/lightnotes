package org.lightnotes.dao;

import org.lightnotes.entity.Label;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface LabelDao {

    List<Label> selectLabelByCreator(long creatorID);

    List<Label> selectLabelByPrevious(long previousID);

    Label selectLabelByID(long labelID);

    int updateLabel(Label label);

    int insertLabel(Label label);

    int deleteLabel(long labelID);
}
