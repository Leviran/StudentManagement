package dao;

import entity.Course;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class McgDao {
    public static List<String> getCidByMAG(String majorid, String grade){
        ResultSet rt = null;
        List<String> list = null;
        String sql = "select cid from mcg where majorid=? and grade=?";
        Object[] params = {majorid,grade};
        rt = DBUtil.executeQuery(sql,params);
        try{
            while (rt.next()){
                String cid = rt.getString("cid");
                list.add(cid);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
