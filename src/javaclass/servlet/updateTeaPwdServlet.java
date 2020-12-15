package servlet;

import dao.TeacherDao;
import entity.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/updateTeaPwdServlet")
public class updateTeaPwdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        String newpwd=req.getParameter("newpwd");
        Teacher tea = TeacherDao.getTeaById(id);
        String ifSuccess = null;
        if(tea!=null){
            try {
                TeacherDao.changePassword(tea,newpwd);
                ifSuccess="success";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            ifSuccess="failed";
            //todo 获取教师信息失败，处理：提示出错/提示无该教师信息，是否要添加该...不合适不合适
        }

        ServletContext application=this.getServletContext();
        application.getRequestDispatcher("/jsp/AdminUpdateTeaPwd.jsp?ifSuccess="+ifSuccess).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
