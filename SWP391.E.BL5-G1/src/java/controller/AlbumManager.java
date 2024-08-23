/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.albumDAO;
import dal.billDAO;
import dal.productDAO;
import model.Product;
import model.Album;
import model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Objects;
import model.Product_Active;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "albumManager", urlPatterns = {"/album"})
public class AlbumManager extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        String page = "";
        HttpSession session = request.getSession();
        model.User user = (model.User) session.getAttribute("user");
        int user_id = user.getUser_id();
        String id = request.getParameter("album_id");
        int album_id = 1;
        if (id == null || id.isEmpty()) {
            albumDAO c = new albumDAO();
            album_id = c.getFirstAlbum(user_id);
        } else {
            album_id = Integer.parseInt(id);
        }
        page = "album.jsp";

        if (action != null) {
            if (action.equalsIgnoreCase("addAlbum")) {
                String album_name = request.getParameter("album_name");
                String description = request.getParameter("description");
                albumDAO c = new albumDAO();
                c.addAlbum(user_id, album_name, description);
                response.sendRedirect("album");
            } else if (action.equalsIgnoreCase("addProduct")) {
                albumDAO c = new albumDAO();
                String product_name = request.getParameter("product_name");
                String product_price = request.getParameter("product_price");
                float price = Float.parseFloat(product_price);
                String album_ID = request.getParameter("album_id");
                int _id = Integer.parseInt(album_ID);
                String product_img = request.getParameter("product_img");
                String product_id = request.getParameter("product_id");
                c.addProductAlbum(album_id, product_id, product_name, price, product_img);
                response.sendRedirect("album");
            } else if (action.equalsIgnoreCase("deleteProduct")) {
                String product_id = request.getParameter("product_id");
                albumDAO c = new albumDAO();
                c.ProductDelete(product_id);
                response.sendRedirect("album");
            } else if (action.equalsIgnoreCase("deleteAlbum")) {
                albumDAO c = new albumDAO();

                c.AlbumDelete(album_id);
                response.sendRedirect("album");
            } else if(action.equalsIgnoreCase("filter")){
                albumDAO c = new albumDAO();
                if (request.getParameter("album_id") != null) {
                    id = request.getParameter("album_id");
                    album_id = Integer.parseInt(id);
                } else {
                    album_id = c.getFirstAlbum(user_id);
                }
                List<Product> product = c.getProduct(album_id);
                List<Album> album = c.getList(user_id);
                request.setAttribute("AlbumData", album);
                request.setAttribute("ProductData", product);
                request.setAttribute("album_id", album_id);
                page = "album.jsp";
            }
        } else {
            if (action == null || action.equalsIgnoreCase("filter")) {
                albumDAO c = new albumDAO();
                if (request.getParameter("album_id") != null) {
                    id = request.getParameter("album_id");
                    album_id = Integer.parseInt(id);
                } else {
                    album_id = c.getFirstAlbum(user_id);
                }
                List<Product> product = c.getProduct(album_id);
                List<Album> album = c.getList(user_id);
                request.setAttribute("AlbumData", album);
                request.setAttribute("ProductData", product);
                request.setAttribute("album_id", album_id);
                page = "album.jsp";

            }
        }
        RequestDispatcher dd = request.getRequestDispatcher(page);
        dd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public int BUFFER_SIZE = 1024 * 1000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        processRequest(request, response);
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
        processRequest(request, response);
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
