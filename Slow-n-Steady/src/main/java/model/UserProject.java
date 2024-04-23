/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author anxnimus
 */
public class UserProject {

    private long userId;
    private long projectId;
    private long privilegesId;

    public UserProject(long userId, long projectId, long privilegesId) {
        this.userId = userId;
        this.projectId = projectId;
        this.privilegesId = privilegesId;
    }

    public UserProject(long userId) {
        this.userId = userId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public long getPrivilegesId() {
        return privilegesId;
    }

    public void setPrivilegesId(long privilegesId) {
        this.privilegesId = privilegesId;
    }

    //toString
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("UserProject{");
        sb.append("userId=").append(userId);
        sb.append(", projectId=").append(projectId);
        sb.append(", privilegesId=").append(privilegesId);
        sb.append('}');
        return sb.toString();
    }

}
