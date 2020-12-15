package entity;

import java.sql.Blob;

public class Student {
    private String id;
    private String name;
    private String password;
    private String birth;
    private String department;
    private String major;
    private String grade;
    private String sex;
    private String mail;
    private String clazz;

    public Student(){
    }

    public Student(String id, String name, String password, String birth, String department, String major, String grade, String sex, String mail,String clazz) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.birth = birth;
        this.department = department;
        this.major = major;
        this.grade = grade;
        this.sex = sex;
        this.mail = mail;
        this.clazz = clazz;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
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

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
}
