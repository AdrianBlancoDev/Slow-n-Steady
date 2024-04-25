/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author anxnimus
 */
public class Task {

    private long id;
    private String name;
    private String description;
    private String timeEstimacy;
    private int priority;
    private long projectId;
    private long sprintId;
    private long stateId;

    //Constructor
    public Task(){}
    
    public Task(long id, String name, String description, String timeEstimacy, int priority, long projectId, long sprintId, long stateId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.timeEstimacy = timeEstimacy;
        this.priority = priority;
        this.projectId = projectId;
        this.sprintId = sprintId;
        this.stateId = stateId;
    }

    public Task(long id) {
        this.id = id;
    }

    public Task(String name, String description, String timeEstimacy, int priority, long projectId, long sprintId, long stateId) {
        this.name = name;
        this.description = description;
        this.timeEstimacy = timeEstimacy;
        this.priority = priority;
        this.projectId = projectId;
        this.sprintId = sprintId;
        this.stateId = stateId;
    }

    public Task(String name) {
        this.name = name;
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

    public String getTimeEstimacy() {
        return timeEstimacy;
    }

    public void setTimeEstimacy(String timeEstimacy) {
        this.timeEstimacy = timeEstimacy;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public long getSprintId() {
        return sprintId;
    }

    public void setSprintId(long sprintId) {
        this.sprintId = sprintId;
    }

    public long getStateId() {
        return stateId;
    }

    public void setStateId(long stateId) {
        this.stateId = stateId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Task{");
        sb.append("id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", description=").append(description);
        sb.append(", timeEstimacy=").append(timeEstimacy);
        sb.append(", priority=").append(priority);
        sb.append(", projectId=").append(projectId);
        sb.append(", sprintId=").append(sprintId);
        sb.append(", stateId=").append(stateId);
        sb.append('}');
        return sb.toString();
    }
    
    
}
