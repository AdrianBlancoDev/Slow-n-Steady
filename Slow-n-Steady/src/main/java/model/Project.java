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
public class Project {

    private long id;
    private String name;
    private String description;
    private Date creationDate;
    private Date startDate;
    
    //Constructors
    public Project(long id, String name, String description, Date creationDate, Date startDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.creationDate = creationDate;
        this.startDate = startDate;
    }
    public Project(String name, String description, Date startDate) {
        this.name = name;
        this.description = description;
        this.startDate = startDate;
    }
    public Project(long id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;

    }

    public Project(long id) {
        this.id = id;
    }

    public Project(String name, String description, Date creationDate, Date startDate) {
        this.name = name;
        this.description = description;
        this.creationDate = creationDate;
        this.startDate = startDate;
    }

    public Project() {
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

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }    

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Project{");
        sb.append("id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", description=").append(description);
        sb.append(", creationDate=").append(creationDate);
        sb.append(", startDate=").append(startDate);
        sb.append('}');
        return sb.toString();
    }
    
}
