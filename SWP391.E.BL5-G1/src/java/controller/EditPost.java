/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.postDAO;
import dal.postTypeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Post;
import model.PostType;

/**
 *
 * @author Putaa
 */
@WebServlet(name = "EditPost", urlPatterns = {"/editPost"})
public class EditPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String postIdStr = request.getParameter("postId");
        int postId = Integer.parseInt(postIdStr);

        postDAO postDAO = new postDAO();
        postTypeDAO postTypeDAO = new postTypeDAO();

        try {
            // Lấy thông tin bài viết theo ID
            Post post = postDAO.getPostById(postId);

            // Lấy danh sách tất cả các loại bài viết
            List<PostType> postTypes = postTypeDAO.getAllPostTypes();

            // Gán thông tin bài viết và các loại bài viết vào thuộc tính request
            request.setAttribute("post", post);
            request.setAttribute("postTypes", postTypes);

            // Chuyển tiếp đến trang editPost.jsp
            request.getRequestDispatcher("editPost.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postIdStr = request.getParameter("postId");
        int postId = Integer.parseInt(postIdStr);
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String postTypeIdStr = request.getParameter("postTypeId");
        int postTypeId = Integer.parseInt(postTypeIdStr);
        java.sql.Date updateAt = new java.sql.Date(System.currentTimeMillis());
        HttpSession session = request.getSession();
        model.User user = (model.User) session.getAttribute("user");
        postDAO postDAO = new postDAO();

        try {
            Post post = new Post(postId, title, content, postTypeId, user.getUser_id(), null, updateAt);
            postDAO.updatePost(post);

            response.sendRedirect("listPosts");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
