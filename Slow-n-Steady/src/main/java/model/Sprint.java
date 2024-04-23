/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author anxnimus
 */
public class Sprint {

    private long id;
    private String name;
    private String description;
    private Date startDate;
    private Date endDate;
    private long projectId;
    
    //Constructors

    public Sprint(long id, String name, String description, Date startDate, Date endDate, long projectId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.projectId = projectId;
    }

    public Sprint(long id) {
        this.id = id;
    }

    public Sprint(String name) {
        this.name = name;
    }

    public Sprint(String name, String description, Date startDate, Date endDate, long projectId) {
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.projectId = projectId;
    }

    public Sprint() {
    }
    
    //Accessors

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }
    //toString

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Sprint{");
        sb.append("id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", description=").append(description);
        sb.append(", startDate=").append(startDate);
        sb.append(", endDate=").append(endDate);
        sb.append(", projectId=").append(projectId);
        sb.append('}');
        return sb.toString();
    }
    
}
