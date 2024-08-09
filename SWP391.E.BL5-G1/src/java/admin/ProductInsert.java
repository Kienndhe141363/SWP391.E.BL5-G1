/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Color;
import model.Product;
import model.Product_Active;
import model.Size;

/**
 *
 * @author ADMIN
 */
public class ProductInsert extends HttpServlet {

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
            out.println("<title>Servlet test</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet test at " + request.getContextPath() + "</h1>");
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
        productDAO c = new productDAO();
        List<Category> category = c.getCategory();
        request.setAttribute("CategoryData", category);
        request.getRequestDispatcher("productinsert.jsp").forward(request, response);
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
        String product_id = request.getParameter("product_id");
        String category_id = request.getParameter("category_id");
        String product_name = request.getParameter("product_name");
        String product_price = request.getParameter("price");
        String product_size = request.getParameter("size");
        String product_color = request.getParameter("color");
        String product_quantity = request.getParameter("quantity");
        String product_img = "images/" + request.getParameter("product_img");
        String product_describe = request.getParameter("describe");
        String active = request.getParameter("permission");
        int quantity = Integer.parseInt(product_quantity);
        Float price = Float.valueOf(product_price);
        int cid = Integer.parseInt(category_id);
        productDAO dao = new productDAO();
        Category cate = new Category(cid);
        String[] size_rw = product_size.split("\\s*,\\s*");
        String[] color_rw = product_color.split("\\s*,\\s*");
        List<Size> list = new ArrayList<>();
        for (String s : size_rw) {
            list.add(new Size(product_id, s));
        }
        List<Color> list2 = new ArrayList<>();
        for (String c : color_rw) {
            list2.add(new Color(product_id, c));
        }
        Product product = new Product();
        Product_Active Pa = new Product_Active(product_id, active);
        product.setCate(cate);
        product.setProduct_id(product_id);
        product.setProduct_name(product_name);
        product.setProduct_price(price);
        product.setProduct_describe(product_describe);
        product.setQuantity(quantity);
        product.setImg(product_img);
        product.setSize(list);
        product.setColor(list2);
        product.setActive(Pa);
        dao.insertProduct(product);
        request.getRequestDispatcher("productinsert.jsp").forward(request, response);
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
