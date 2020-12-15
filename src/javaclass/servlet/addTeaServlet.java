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

@WebServlet("/servlet/addTeaServlet")
public class addTeaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id=request.getParameter("id");


        Boolean exist= TeacherDao.isExist(id);
        int flag=0;
        if(!exist) {
            try {

                String pwd=request.getParameter("password");
                String name = request.getParameter("name");
                String sex = request.getParameter("sex");

                Teacher tea=new Teacher();
                tea.setId(id);
                tea.setPassword(pwd);
                tea.setName(name);
                tea.setSex(sex);
                TeacherDao.add(tea);
                //如果添加成功，直接跳回教师档案管理页面
                ServletContext application = this.getServletContext();
                application.getRequestDispatcher("/jsp/ManageTea.jsp?").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }//如果该用户已存在
        else {
            flag=1;
        }

        ServletContext application = this.getServletContext();
        application.getRequestDispatcher("/jsp/AddTeaAccount.jsp?flag="+flag).forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
