package dao;

import entity.CourseTable;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class TableDao {
    public static List<CourseTable> courseForStu(String cid){
        String sql = "select * from course_table where cid =?";
        Object[] params = {cid};
        ResultSet courseset = DBUtil.executeQuery(sql,params);
        List<CourseTable> ctlist = null;
        try{
            while(courseset.next()){
                CourseTable ct = new CourseTable();
                ct.setCid(courseset.getString("cid"));
                ct.setTid(courseset.getString("tid"));
                ct.setAddr(courseset.getString("addr"));
                ct.setDay(courseset.getString("day"));
                ct.setSection(courseset.getString("section"));
                ctlist.add(ct);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return ctlist;
    }

    public static List<CourseTable> courseForTea(String tid){
        String sql = "select * from course_table where tid =?";
        Object[] params = {tid};
        ResultSet courseset = DBUtil.executeQuery(sql,params);
        List<CourseTable> ctlist = null;
        try{
            while(courseset.next()){
                CourseTable ct = new CourseTable();
                ct.setCid(courseset.getString("cid"));
                ct.setTid(courseset.getString("tid"));
                ct.setAddr(courseset.getString("addr"));
                ct.setDay(courseset.getString("day"));
                ct.setSection(courseset.getString("section"));
                ctlist.add(ct);
            }
            return ctlist;
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public static boolean isTakeup(String addr,String day,String sec){
        String sql = "select count(*) from course_table where addr = ? and day = ? and section = ?";
        Object[] params = {addr,day,sec};
        ResultSet rt = DBUtil.executeQuery(sql,params);
        try {
            if(rt.next()){
                if(rt.getInt(1)>0){
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void addCourseTable(CourseTable ct){
        String sql = "insert into course_table (cid,tid,addr,day,section) values (?,?,?,?,? )";
        Object[] params = {ct.getCid(),ct.getTid(),ct.getAddr(),ct.getDay(),ct.getSection()};
        int count = 0;
        try {
            count = DBUtil.executeUpdate(sql,params);
            if(count>0){
                System.out.println("课程安排添加成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("课程安排添加失败");
        }
        return ;
    }

    public static void delCourseTable(CourseTable ct){
        String sql = "delete from course_table where cid=? and tid=? and addr=? and day=? and section=?";
        Object[] params = {ct.getCid(),ct.getTid(),ct.getAddr(),ct.getDay(),ct.getSection()};
        int count = 0;
        try {
            count = DBUtil.executeUpdate(sql,params);
            if(count>0){
                System.out.println("kec安排删除成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("课程安排删除失败");
        }

    }
}
