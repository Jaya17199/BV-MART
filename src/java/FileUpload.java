/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUpload")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
             maxFileSize=1024*1024*10,      // 10MB
             maxRequestSize=1024*1024*50)
public class FileUpload extends HttpServlet {
private static final String SAVE_DIR="imagess";
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
         
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
     response.setContentType("text/html;charset=UTF-8");
    PrintWriter outt = response.getWriter();
        //String savePath = "C:\Users\admin\Documents\NetBeansProjects\WebApplication1" + File.separator + SAVE_DIR; //specify your path here
        
     
         Part filePart = request.getPart("img");
            
          
         String savePath="";
          String path="C:\\Users\\user\\Documents\\NetBeansProjects\\WebApplication1\\web" + File.separator+ SAVE_DIR;
          
          File file=new File(path);
          file.mkdir();
          String fileName = extractFileName(filePart);
          
          OutputStream out = null;
          
            InputStream filecontent = null;
            
           
            try {
        out = new FileOutputStream(new File(path + File.separator
                + fileName));
        
        filecontent = filePart.getInputStream();
     
 
        int read = 0;
        final byte[] bytes = new byte[1024];
 
        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
           
            savePath=path+File.separator+fileName;
            
        }
        
        String DirPlusFileName=null;
        DirPlusFileName=SAVE_DIR+File.separator+fileName;
           
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/bvmart");
        Statement stmt=conn.createStatement();
        
        String query1="SELECT * FROM product WHERE p_id IN (SELECT MAX(p_id) FROM product) ";
        ResultSet rs=stmt.executeQuery(query1);
        int pid=0;   
        while(rs.next())
        {
            pid=rs.getInt(1);
        }
        pid=pid+1;
        String query2="INSERT INTO product values (?,?,?,?,?,?,?,?)";
         PreparedStatement pst;
         pst=conn.prepareStatement(query2);   
            String pname=request.getParameter("txttitle");
            int pprice=Integer.parseInt(request.getParameter("txtprice"));
            String pdesc=request.getParameter("txtdesc");
            String cat=request.getParameter("drpCat");
            String sid=request.getParameter("sid");
           pst.setInt(1,pid);
           pst.setString(2,pname);
           pst.setInt(3,pprice);
           pst.setString(4,pdesc);
           pst.setString(5,DirPlusFileName);
           pst.setInt(6,0);
            
            ResultSet rst=stmt.executeQuery("select c_id from category where c_name='"+cat+"'");
            while(rst.next())
            {
                pst.setInt(7,rst.getInt(1));
            }
            pst.setString(8,sid);
           int x= pst.executeUpdate();
           if(x>0)
           {
               response.sendRedirect("success1.jsp?sid="+sid);
            }
        else{
            response.sendRedirect("error1.jsp?sid="+sid);
        }
               
      }
            
            catch(Exception ex){
                             outt.println(ex);
            }
    }

    // file name of the upload file is included in content-disposition header like this:
//form-data; name="dataFile"; filename="PHOTO.JPG"
private String extractFileName(Part part) {
  final String partHeader = part.getHeader("content-disposition");
    
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

