/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.billDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.CheckBill;

/**
 *
 * @author Putaa
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {

            HttpSession session = request.getSession(true);
            model.Cart cart = null;
            String payment = null;
            billDAO dao = new billDAO();
            String payment_method = request.getParameter("payment_method");
            //check card
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (model.Cart) o;
            } else {
                cart = new model.Cart();
            }
            model.User acc = null;
            Object u = session.getAttribute("user");
            if (o != null) {
                if (u != null) {
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    if (payment_method.equals("momo")) {
                        payment = "MOMO";
                    }
                    if (payment_method.equals("vnpay")) {
                        payment = "VNPAY";
                    }
                    if (payment_method.equals("cod")) {
                        payment = "COD";
                    }
                    int phonenumber = Integer.parseInt(phone);
                    acc = (model.User) u;
                    //create bill
                    CheckBill bill = createBill(acc, cart, payment, address, Integer.toString(phonenumber));
                    if (payment_method.equals("cod")) {
                        acc = (model.User) u;
                        dao.addOrder(acc, cart, payment, address, phonenumber);
                        session.removeAttribute("cart");
                        session.setAttribute("size", 0);
                        request.getSession().setAttribute("orderSuccessMessage", "Đơn hàng của bạn đã được đặt thành công!");
                        response.sendRedirect("home");
                    }
                    if (payment_method.equals("vnpay")) {
                        int total;
                        total = (int) Math.round(bill.getCart().getTotalMoney());

                        request.getSession().setAttribute("pendingBill", bill);

                        request.setAttribute("total", total);
                        request.setAttribute("bill", bill);
                        request.setAttribute("billId", dao.GetLastId() + 1);
                        request.getRequestDispatcher("VN_Pay/vnpay_pay.jsp").forward(request, response);
                    }

                } else {
                    response.sendRedirect("user?action=login");
                }
            } else {
                if (payment_method.equals("momo")) {
                    model.Bill bill = dao.getBill();
                    int total = Math.round(bill.getTotal());
                    request.setAttribute("total", total);
                    request.setAttribute("bill", bill);
                    request.getRequestDispatcher("qrcode.jsp").forward(request, response);
                }
                if (payment_method.equals("cod")) {
                    response.sendRedirect("home");
                }
            }
        } catch (Exception e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

    private CheckBill createBill(model.User u, model.Cart c, String pay, String add, String phone) {
        CheckBill bill = new CheckBill();
        bill.setUser(u);
        bill.setCart(c);
        bill.setPayment(pay);
        bill.setAddress(add);
        bill.setPhone(phone);
        return bill;
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
        HttpSession session = request.getSession(true);
        Object u = session.getAttribute("user");
        if (u != null) {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("user?action=login");
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
