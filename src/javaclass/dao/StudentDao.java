package dao;

import entity.Student;
import util.DBUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {

    //检查学生账号密码是否输入正确

    public static int logincheck(Student student)throws SQLException
    {
        String sql="select count(*) from student where id=? and password=?";
        Object[] params = {student.getId(),student.getPassword()};
        ResultSet rt = null;
        rt = DBUtil.executeQuery(sql,params);
        if(rt.next()){
            return 1;
        }
        else{
            return 0;
        }
    }

    public static void del(String sid)throws Exception
    {
        String sql = "delete from student where id = ?";
        Object[] params = {sid};
        int count = DBUtil.executeUpdate(sql,params);
        if(count>0){
            System.out.println("删除成功！");
        }else{
            System.out.println("未找到相应信息或删除失败！");
        }
    }

    public static void add(Student s){
        String sql = "insert into student (id,name,birth,department,major,grade,sex,mail,clazz)values(?,?,?,?,?,?,?,?,?)";
        Object[] params = {s.getId(),s.getName(),s.getBirth(),s.getDepartment(),s.getMajor(),s.getGrade(),s.getSex(),s.getMail(),s.getClazz()};
        try {
            int count = DBUtil.executeUpdate(sql,params);
            if(count>0){
                System.out.println("添加学生成功！");
            }else {
                System.out.println("添加学生失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("添加学生失败！");
        }
    }

    public static Boolean isExist(String id){
        ResultSet rt = null;
        String sql = "select count(*) from student where id = ?";
        Object[] params = {id};
        rt = DBUtil.executeQuery(sql,params);

        try {
            if(rt.next()){
                if(rt.getInt(1)>0){
                    return true;
                } else{
                    return false;
                }
            }else {
                return false;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
//todo:总觉得这里两个id怪怪的
    public static void updateInfo(Student stu,String oldid){
        String sql = "update student set id=?,name=?,password=?,birth=?,department=?,major=?,grade=?,sex=?,mail=? ,clazz=? where id = ?";
        Object[] params = {stu.getId(),stu.getName(),stu.getPassword(),stu.getBirth(),stu.getDepartment(),stu.getMajor(),stu.getGrade(),stu.getSex(),stu.getMail(),stu.getClazz(),oldid};
        try {
            int count = DBUtil.executeUpdate(sql,params);
            if(count>0){
                System.out.println("修改成功！");
            }else {
                System.out.println("修改失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("修改失败！");
        }
    }

    public static void changePassword(Student stu,String newPwd){
        String sql="update student set password = ? where id = ?";
        Object[] params = {newPwd,stu.getId()};
        try {
            int count = DBUtil.executeUpdate(sql,params);
            if(count>0){
                System.out.println("修改成功！");
            }else {
                System.out.println("修改失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("修改失败！");
        }
    }
    public static Student getStuById(String id){
        String sql = "select * from student where id = ?";
        Object[] params = {id};
        ResultSet rt = null;
        Student stu = null;
        try {
            rt = DBUtil.executeQuery(sql,params);
            if(rt.next()){
                stu = new Student();
                stu.setId(rt.getString("id"));
                stu.setName(rt.getString("name"));
                stu.setBirth(rt.getString("birth"));
                stu.setPassword(rt.getString("password"));
                stu.setDepartment(rt.getString("department"));
                stu.setMail(rt.getString("mail"));
                stu.setMajor(rt.getString("major"));
                stu.setSex(rt.getString("sex"));
                stu.setGrade(rt.getString("grade"));
                stu.setClazz(rt.getString("clazz"));
                return stu;
            }else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static Student getStuByName(String name){
        String sql = "select * from student where name = ?";
        Object[] params = {name};
        ResultSet rt = null;
        Student stu = null;
        try {
            rt = DBUtil.executeQuery(sql,params);
            if(rt.next()){
                stu = new Student();
                stu.setId(rt.getString("id"));
                stu.setName(rt.getString("name"));
                stu.setBirth(rt.getString("birth"));
                stu.setPassword(rt.getString("password"));
                stu.setDepartment(rt.getString("department"));
                stu.setMail(rt.getString("mail"));
                stu.setMajor(rt.getString("major"));
                stu.setSex(rt.getString("sex"));
                stu.setGrade(rt.getString("grade"));
                return stu;
            }else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static List<Student> getAllStu(){
        String sql = "select * from student";
        ResultSet rt = null;
        List<Student> stulist = new ArrayList<>();
        rt = DBUtil.executeQuery(sql,null);
        try{
            while(rt.next()){
                Student stu = new Student();
                stu.setId(rt.getString("id"));
                stu.setName(rt.getString("name"));
                stu.setBirth(rt.getString("birth"));
                stu.setPassword(rt.getString("password"));
                stu.setDepartment(rt.getString("department"));
                stu.setMail(rt.getString("mail"));
                stu.setMajor(rt.getString("major"));
                stu.setSex(rt.getString("sex"));
                stu.setGrade(rt.getString("grade"));
                stulist.add(stu);
            }
            return stulist;
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    public static Student getStuEntity(String id){
        ResultSet rt = null;
        String sql = "select * from  student where id = ?";
        Object[] params = {id};
        Student stu = null;
        rt = DBUtil.executeQuery(sql,params);
        try {
            if(rt.next()){
                stu = new Student();
                stu.setId(rt.getString("id"));
                stu.setName(rt.getString("name"));
                stu.setBirth(rt.getString("birth"));
                stu.setPassword(rt.getString("password"));
                stu.setDepartment(rt.getString("department"));
                stu.setMail(rt.getString("mail"));
                stu.setMajor(rt.getString("major"));
                stu.setSex(rt.getString("sex"));
                stu.setGrade(rt.getString("grade"));
                return stu;
            }else {
                return null;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }
}
