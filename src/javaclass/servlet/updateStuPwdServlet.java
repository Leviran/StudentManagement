package servlet;

import dao.StudentDao;
import dao.TeacherDao;
import entity.Student;
import entity.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/updateStuPwdServlet")
public class updateStuPwdServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        String newpwd=req.getParameter("newpwd");
        Student stu = StudentDao.getStuById(id);
        String ifSuccess = null;
        if(stu!=null){
            try {
                StudentDao.changePassword(stu,newpwd);
                ifSuccess = "success";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            ifSuccess="failed";
        }

        ServletContext application=this.getServletContext();
        application.getRequestDispatcher("/jsp/AdminUpdateStuPwd.jsp?ifSuccess="+ifSuccess).forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
