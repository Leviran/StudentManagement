package util;

import java.sql.*;

public class DBUtil {
    public static Connection getConnection()  {
        String url = "jdbc:mysql://localhost:3306/studentmanagement?serverTimezone=UTC&Unicode=true&characterEncoding=utf-8";
        String name  = "root";
        String password = "72760";
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url,name,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (Exception e ){
            e.printStackTrace();
        }

        return  connection;
    }

    public static void closeAll(Connection connection, Statement statement,ResultSet resultSet){

            try {
                if(resultSet!=null){
                resultSet.close();
                }
                if(statement!=null){
                    statement.close();
                }
                if(connection!=null){
                    connection.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
    }

    public static int executeUpdate(String sql,Object[] params)throws Exception
    {
        Connection connection = DBUtil.getConnection();
        PreparedStatement ps= null;
        int count = -1;
        try {
            ps=connection.prepareStatement(sql);
            for(int i=0;i<params.length;i++){
                ps.setObject(i+1,params[i]);
            }
            count = ps.executeUpdate();
            closeAll(connection,ps,null);
            return count;
        }catch (SQLException e){
            e.printStackTrace();
            return -1;}
        catch (Exception e){
            e.printStackTrace();
            return -1;}
    }

    public static ResultSet executeQuery(String sql,Object[] params){
        Connection connection = DBUtil.getConnection();
        PreparedStatement ps = null;
        ResultSet rt = null;
        try {
            ps = connection.prepareStatement(sql);
            if(params!=null){
                for(int i=0;i<params.length;i++){
                    ps.setObject(i+1,params[i]);
                }
            }

            rt = ps.executeQuery();
            return rt;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

}
