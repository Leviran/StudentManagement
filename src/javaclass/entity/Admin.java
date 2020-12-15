package entity;

import java.sql.Blob;

public class Admin {
    private String id;
    private String name;
    private String password;
    private String mail;
    private Blob portrait;

    public Admin(){
    }

    public Admin(String id, String name, String password, String mail, Blob portrait) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.mail = mail;
        this.portrait = portrait;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Blob getPortrait() {
        return portrait;
    }

    public void setPortrait(Blob portrait) {
        this.portrait = portrait;
    }
}
