package dao;

import entity.Student;
import entity.Teacher;
import util.DBUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherDao {

    //检查教师账号密码输入是否正确

    public static int logincheck(Teacher teacher)throws SQLException
    {
        String sql="select count(*) from teacher where id=? and password=?";
        Object[] params = {teacher.getId(),teacher.getPassword()};
        ResultSet rt = null;
        rt = DBUtil.executeQuery(sql,params);
        if(rt.next()){
            return 1;
        }
        else{
            return 0;
        }
    }


    public static void del(String tid)throws Exception
    {
        String sql = "delete from teacher where id = ?";
        Object[] params = {tid};
        int count = DBUtil.executeUpdate(sql,params);
        if(count>0){
            System.out.println("删除成功！");
        }else{
            System.out.println("未找到相应信息或删除失败！");
        }
    }

    public static void add(Teacher t){
        String sql = "insert into teacher (id,name,password,sex,mail)values(?,?,?,?,?)";
        Object[] params = {t.getId(),t.getName(),t.getPassword(),t.getSex(),t.getMail()};
        try {
            int count = DBUtil.executeUpdate(sql,params);
            if(count>0){
                System.out.println("添加教师成功！");
            }else {
                System.out.println("添加教师失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void changePassword(Teacher tea,String newPwd){
        String sql="update teacher set password = ? where id = ?";
        Object[] params = {newPwd,tea.getId()};
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
    public static List<String> getCidList(String tid){
        String sql = "select cid from course_table where tid = ?";
        Object[] params = {tid};
        ResultSet rt = null;
        List<String> list = null;
        rt = DBUtil.executeQuery(sql,params);
        try{
            while(rt.next()){
                String cid = rt.getString("cid");
                list.add(cid);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    public static Boolean isExist(String id){
        ResultSet rt = null;
        String sql = "select count(*) from teacher where id = ?";
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

    public static Teacher getTeaEntity(String id){
        ResultSet rt = null;
        String sql = "select * from  teacher where id = ?";
        Object[] params = {id};
        Teacher tea = null;
        rt = DBUtil.executeQuery(sql,params);
        try {
            if(rt.next()){
                tea = new Teacher();
                tea.setId(rt.getString("id"));
                tea.setName(rt.getString("name"));
                tea.setPassword(rt.getString("password"));
                tea.setDepartment(rt.getString("department"));
                tea.setMail(rt.getString("mail"));
                tea.setSex(rt.getString("sex"));
                return tea;
            }else {
                return null;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public static Teacher getTeaByName(String name){
        String sql = "select * from teacher where name = ?";
        Object[] params = {name};
        ResultSet rt = null;
        Teacher tea = null;
        try {
            rt = DBUtil.executeQuery(sql,params);
            if(rt.next()){
                tea = new Teacher();
                tea.setId(rt.getString("id"));
                tea.setName(rt.getString("name"));
                tea.setPassword(rt.getString("password"));
                tea.setDepartment(rt.getString("department"));
                tea.setMail(rt.getString("mail"));
                tea.setSex(rt.getString("sex"));
                return tea;
            }else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static Teacher getTeaById(String id){
        String sql = "select * from teacher where id = ?";
        Object[] params = {id};
        ResultSet rt = null;
        Teacher tea = null;
        try {
            rt = DBUtil.executeQuery(sql,params);
            if(rt.next()){
                tea = new Teacher();
                tea.setId(rt.getString("id"));
                tea.setName(rt.getString("name"));
                tea.setPassword(rt.getString("password"));
                tea.setDepartment(rt.getString("department"));
                tea.setMail(rt.getString("mail"));
                tea.setSex(rt.getString("sex"));
                return tea;
            }else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<Teacher> getAllTea(){
        String sql = "select * from teacher";
        ResultSet rt = null;
        List<Teacher> tealist = new ArrayList<>();
        rt = DBUtil.executeQuery(sql,null);
        try{
            while(rt.next()){
                Teacher tea = new Teacher();
                tea.setId(rt.getString("id"));
                tea.setName(rt.getString("name"));
                tea.setPassword(rt.getString("password"));
                tea.setDepartment(rt.getString("department"));
                tea.setMail(rt.getString("mail"));
                tea.setSex(rt.getString("sex"));
                tealist.add(tea);
            }
            return tealist;
        }catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    //todo:总觉得这里两个id怪怪的
    public static void updateInfo(Teacher tea,String oldid){
        String sql = "update teacher set id=?,name=?,password=?,department=?sex=?,mail=?  where id = ?";
        Object[] params = {tea.getId(),tea.getName(),tea.getPassword(),tea.getDepartment(),tea.getSex(),tea.getMail(),oldid};
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

}
