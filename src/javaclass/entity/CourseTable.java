package entity;

public class CourseTable {
    private String cid;
    private String tid;
    private String addr;
    private String day;
    private String section;
    public CourseTable(){}

    public CourseTable(String cid, String tid, String addr, String day, String section) {
        this.cid = cid;
        this.tid = tid;
        this.addr = addr;
        this.day = day;
        this.section = section;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }


}
