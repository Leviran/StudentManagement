package servlet;

import dao.StudentDao;
import dao.TeacherDao;
import entity.Student;
import entity.Teacher;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/ChangePwdTeaServlet")
public class ChangePwdTeaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String oldpwd=request.getParameter("oldpwd");
        String newpwd=request.getParameter("newpwd");
        Teacher tea = TeacherDao.getTeaById(id);
        //如果旧密码正确
        if(tea.getPassword().equals(oldpwd)){
            try {
                TeacherDao.changePassword(tea,newpwd);
                request.setAttribute("oldpwdwrong","right");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            //TODO 不知道这里用request OK不，作用域
            request.setAttribute("oldpwdwrong","wrong");
        }

        ServletContext application=this.getServletContext();
        application.getRequestDispatcher("/jsp/changePwdTea.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
