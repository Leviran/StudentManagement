package servlet;

import dao.AdminDao;
import dao.StudentDao;
import dao.TeacherDao;
import entity.Admin;
import entity.Student;
import entity.Teacher;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author yuan
 */
@WebServlet(name = "loginCheckServlet",urlPatterns = "/servlet/loginCheckServlet")
public class loginCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session =  request.getSession();
        session.setAttribute("session","session_used");
        //获取登录者身份
        String login = request.getParameter("radio");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        //获取用户输入的验证码
        String code=request.getParameter("code");
        //todo code_session？
        String code_session=(String)session.getAttribute("code_session");
        ServletContext application = this.getServletContext();
        if(code_session==null)
        {
            response.getWriter().write("code error");
            return;
        }
        //忽略大小写
        if(!code.equalsIgnoreCase(code))
        {
            response.getWriter().write("code error");
            return;
        }
        session.removeAttribute("code_session");

        //登录者是学生
        if(login.equals("student")) {
            Student stu = new Student();
            stu.setId(id);
            stu.setPassword(pwd);
            int result = -2;
            try {
                //理论上成功了是1，不成功是0
                result = StudentDao.logincheck(stu);
            } catch (Exception e) {
                e.printStackTrace();
            }

            // 查找成功
            if (result == 1)
            {
                session.setAttribute("Sid",id);
                request.setAttribute("ifFail","success");
                application.getRequestDispatcher("/jsp/FrameS.jsp?number=" + id).forward(request, response);

            }else if (result == 0)
            {
                //查找失败
                request.setAttribute("ifFail","failed");
                application.getRequestDispatcher("/index.jsp").forward(request, response);

            }
        }
        else if(login.equals("admin"))
        {
            //管理员
            Admin admin = new Admin();
            admin.setId(id);
            admin.setPassword(pwd);

            int result = 0;
            try {
                result = AdminDao.logincheck(admin);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //登录成功
            if(result==1) {
                session.setAttribute("Aid",id);
                //这里用request好像不大合适,,,,,而且没啥用
                request.setAttribute("ifFail","success");
                RequestDispatcher rd = application.getRequestDispatcher("/jsp/FrameA.jsp?number=" + id);
                rd.forward(request, response);
            }
            // 登录失败
            else {
                //返回登录界面
                request.setAttribute("ifFail","failed");
                application.getRequestDispatcher("/index.jsp").forward(request, response);
            }


        }
        else if(login.equals("teacher"))
        {
            Teacher tea=new Teacher();
            tea.setId(id);
            tea.setPassword(pwd);
            int result = -1;
            try {
                result = TeacherDao.logincheck(tea);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //登录成功
            if(result==1) {
                session.setAttribute("Tid",id);
                request.setAttribute("ifFail","success");
                RequestDispatcher rd = application.getRequestDispatcher("/jsp/FrameT.jsp?number=" + id);
                rd.forward(request, response);
            }
            // 登录失败
            else {
                request.setAttribute("ifFail","failed");
                application.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
