package org.lightnotes.dao;

import org.lightnotes.entity.Team;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface TeamDao {

    Team selectTeamByID(long teamID);

    List<Team> selectTeamByCreator(long CreatorID);

    List<Team> selectTeamByName(String name);

    int updateTeam(Team team);

    int insertTeam(Team team);

    int deleteTeam(long teamID);
}
