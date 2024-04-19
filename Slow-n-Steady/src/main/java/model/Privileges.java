/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author anxnimus
 */
public class Privileges {

    private long id;
    private boolean create;
    private boolean read;
    private boolean update;
    private boolean delete;

    //Constructors
    public Privileges(long id, boolean create, boolean read, boolean update, boolean delete) {
        this.id = id;
        this.create = create;
        this.read = read;
        this.update = update;
        this.delete = delete;
    }

    public Privileges(long id) {
        this.id = id;
    }

    public Privileges(boolean create, boolean read, boolean update, boolean delete) {
        this.create = create;
        this.read = read;
        this.update = update;
        this.delete = delete;
    }

    //Accessors
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public boolean isCreate() {
        return create;
    }

    public void setCreate(boolean create) {
        this.create = create;
    }

    public boolean isRead() {
        return read;
    }

    public void setRead(boolean read) {
        this.read = read;
    }

    public boolean isUpdate() {
        return update;
    }

    public void setUpdate(boolean update) {
        this.update = update;
    }

    public boolean isDelete() {
        return delete;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }
    
    //toString

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Privileges{");
        sb.append("id=").append(id);
        sb.append(", create=").append(create);
        sb.append(", read=").append(read);
        sb.append(", update=").append(update);
        sb.append(", delete=").append(delete);
        sb.append('}');
        return sb.toString();
    }
    
}
