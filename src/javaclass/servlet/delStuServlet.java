package servlet;

import dao.StudentDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "delStuServlet",urlPatterns = "/servlet/delStuServlet")
public class delStuServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        try {
            StudentDao.del(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ServletContext application = this.getServletContext();
        application.getRequestDispatcher("/jsp/ManageStu.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
