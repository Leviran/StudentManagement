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

@WebServlet("/servlet/addStuServlet")
public class addStuServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id=request.getParameter("id");


        Boolean exist= StudentDao.isExist(id);
        int flag=0;
        if(!exist) {
            try {

                String pwd=request.getParameter("password");
                String name = request.getParameter("name");
                String sex = request.getParameter("sex");

                Student stu=new Student();
                stu.setId(id);
                stu.setPassword(pwd);
                stu.setName(name);
                stu.setSex(sex);
                StudentDao.add(stu);
                //如果添加成功，直接跳回学生档案管理页面
                ServletContext application = this.getServletContext();
                application.getRequestDispatcher("/jsp/ManageStu.jsp?").forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }//如果该用户已存在
        else {
            flag=1;
        }

        ServletContext application = this.getServletContext();
        application.getRequestDispatcher("/jsp/AddStuAccount.jsp?flag="+flag).forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
