package entity;


public class Course {
    private String cid;
    private String cname;
    private float credit;
    public Course(){}

    public Course(String cid, String cname, float credit) {
        this.cid = cid;
        this.cname = cname;
        this.credit = credit;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        this.credit = credit;
    }
}
