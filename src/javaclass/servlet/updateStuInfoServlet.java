package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.StudentDao;
import entity.Student;

@WebServlet("/servlet/updateStuInfoServlet")
public class updateStuInfoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldid = request.getParameter("oldid");
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String birth=request.getParameter("birth");
        String sex=request.getParameter("sex");
        String department=request.getParameter("department");
        String major=request.getParameter("major");
        String grade=request.getParameter("grade");
        String clazz=request.getParameter("clazz");
        String mail=request.getParameter("mail");
        //todo portrait
        Student stu = StudentDao.getStuById(oldid);


        stu.setId(id);
        stu.setName(name);
        stu.setBirth(birth);
        stu.setDepartment(department);
        stu.setMajor(major);
        stu.setGrade(grade);
        stu.setSex(sex);
        stu.setMail(mail);
        stu.setClazz(clazz);

        try {
            StudentDao.updateInfo(stu,oldid);
            request.setAttribute("ifSuccess","success");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ifSuccess","failed");
        }
        ServletContext application=this.getServletContext();
        //修改成功后跳转回去
        RequestDispatcher rd=application.getRequestDispatcher("/jsp/updateStuInfo.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
