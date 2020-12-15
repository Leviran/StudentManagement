package entity;

public class Scoreinfo {
    private String cid;
    private String sid;
    private String score;
    private String level;
    public Scoreinfo(){}

    public Scoreinfo(String cid, String sid, String score, String level) {
        this.cid = cid;
        this.sid = sid;
        this.score = score;
        this.level = level;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
