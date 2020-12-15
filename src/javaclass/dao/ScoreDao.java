package dao;

import entity.Scoreinfo;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScoreDao {
    public static List<Scoreinfo> getScoreInfo(String cid){
        String sql = "select * from scoureinfo where cid = ?";
        Object[] params = {cid};
        ResultSet rt = null;
        List<Scoreinfo> list = new ArrayList<>();
        Scoreinfo si = new Scoreinfo();
        si.setCid(cid);
        rt = DBUtil.executeQuery(sql,params);
        try{
            while(rt.next()){
                String sid = rt.getString("sid");
                String score = rt.getString("score");
                String level = rt.getString("level");
                si.setSid(sid);
                si.setScore(score);
                si.setLevel(level);
                list.add(si);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
