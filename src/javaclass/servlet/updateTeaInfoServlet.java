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

@WebServlet("/servlet/updateTeaInfoServlet")
public class updateTeaInfoServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String oldid = request.getParameter("oldid");
            String id=request.getParameter("id");
            String name=request.getParameter("name");
            String sex=request.getParameter("sex");
            String department=request.getParameter("department");
            String mail=request.getParameter("mail");
            //todo portrait
            Teacher tea=TeacherDao.getTeaById(oldid);


            tea.setId(id);
            tea.setName(name);
            tea.setDepartment(department);
            tea.setSex(sex);
            tea.setMail(mail);

            try {
                TeacherDao.updateInfo(tea,oldid);
                request.setAttribute("ifSuccess","success");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("ifSuccess","failed");
            }
            ServletContext application=this.getServletContext();
            //修改成功后跳转回去
            RequestDispatcher rd=application.getRequestDispatcher("/jsp/updateTeaInfo.jsp");
            rd.forward(request,response);
        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            doPost(req,resp);
        }
    }

