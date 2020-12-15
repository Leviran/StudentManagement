package dao;

import entity.Admin;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {


    //检查管理员账号密码输入是否正确

    public static int logincheck(Admin admin)throws SQLException
    {
        String sql="select count(*) from admin where id=? and password=?";
        Object[] params = {admin.getId(),admin.getPassword()};
        ResultSet rt = null;
        rt = DBUtil.executeQuery(sql,params);
        if(rt.next()){
            return 1;
        }
        else{
            return 0;
        }
    }


}
