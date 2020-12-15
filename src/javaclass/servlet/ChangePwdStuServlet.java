package servlet;

import dao.StudentDao;
import entity.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/servlet/ChangePwdStuServlet")
public class ChangePwdStuServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String oldpwd=request.getParameter("oldpwd");
        String newpwd=request.getParameter("newpwd");
        Student stu = StudentDao.getStuById(id);
        //如果旧密码正确
        if(stu.getPassword().equals(oldpwd)){
            try {
                StudentDao.changePassword(stu,newpwd);
                request.setAttribute("oldpwdwrong","right");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            //TODO 不知道这里用request OK不，作用域
            request.setAttribute("oldpwdwrong","wrong");
        }

        ServletContext application=this.getServletContext();
        application.getRequestDispatcher("/jsp/changePwdStu.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);
    }
}
