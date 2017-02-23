package org.lightnotes.dao;

import org.lightnotes.entity.Organization;

import java.util.List;

/**
 * Created by Bill Chen on 2017/2/21.
 */
public interface OrganizationDao {

    List<Organization> selectOrganizationByUser(long userID);

    List<Organization> selectOrganizationByTeam(long teamID);

    int insertOrganization(Organization organization);

    int deleteOrganization(long userID,long teamID);
}
