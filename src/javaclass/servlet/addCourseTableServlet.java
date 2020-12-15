package servlet;

import dao.TableDao;
import entity.CourseTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="addCourseTableServlet" ,urlPatterns = "/servlet/addCourseTableServlet")
public class addCourseTableServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String addr = request.getParameter("addr");
        String day = request.getParameter("day");
        String sec = request.getParameter("sec");
        //如果当时该教室没有被占
        if(!TableDao.isTakeup(addr,day,sec)){
            String cid = request.getParameter("cid");
            String tid = request.getParameter("tid");
            CourseTable ct = new CourseTable(cid,tid,addr,day,sec);
            TableDao.addCourseTable(ct);
            //添加成功则直接跳转到课程安排管理页面
            this.getServletContext().getRequestDispatcher("/jsp/ManageCourseShow.jsp?").forward(request,response);

        }else{
            int takeup = 0;
            this.getServletContext().getRequestDispatcher("/jsp/addCourseA.jsp?takeup="+takeup).forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
