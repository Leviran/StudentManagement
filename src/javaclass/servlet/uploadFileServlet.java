package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "uploadFileServlet",urlPatterns = "/servlet/uploadFileServlet")
public class uploadFileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiskFileItemFactory d=new DiskFileItemFactory();
        ServletFileUpload upload=new ServletFileUpload(d);
        try {
            List<FileItem> list=upload.parseRequest(req);
            for (FileItem fileItem:list){
                if(fileItem.isFormField()){
                    System.out.println(fileItem.getFieldName() + "---" + fileItem.getString("UTF-8"));
                }
                else {
                    //如果是文件，这时我们需要把文件写到本地（服务器）
                    System.out.println("文件名：" + fileItem.getName());
                    System.out.println("文件类型：" + fileItem.getContentType());
                    System.out.println("文件大小：" + fileItem.getSize());
                    System.out.println("文件字段：" + fileItem.getString("UTF-8"));
                    //文件保存路径(每一天设置一个子文件夹
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
                    String dateStr = simpleDateFormat.format(new Date());

                    String path = req.getServletContext().getRealPath("upload/" + dateStr);
                    File dir = new File(path);
                    if (!dir.exists()) {
                        //mkdirs可以多级创建目录
                        dir.mkdirs();
                    }
                    //获取文件名后缀
                    String[] tmpStrs = fileItem.getName().split("\\.");
                    String suffix = tmpStrs[tmpStrs.length - 1];
                    //获取随机的文件名
                    String fileName = UUID.randomUUID().toString() + "." + suffix;
                    //拼接保存文件的路径+文件名
                    String saveFileName = path + "/" + fileName;
                    //写到磁盘
                    fileItem.write(new File(saveFileName));
                    //删除临时文件
                    fileItem.delete();
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        ServletContext application=this.getServletContext();
        RequestDispatcher rd=application.getRequestDispatcher("/jsp/uploadPic.jsp");
        rd.forward(req,resp);
    }

        @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
