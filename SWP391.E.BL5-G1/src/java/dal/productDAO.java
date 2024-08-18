/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Category;
import model.Color;
import model.Product;
import model.Size;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Product_Active;

public class productDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //namnthe140786
    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertProduct(Product product) {
        String sql = "INSERT INTO product (product_id,category_id,product_name,product_price,product_describe,quantity,img) VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getProduct_id());
            ps.setInt(2, product.getCate().getCategory_id());
            ps.setString(3, product.getProduct_name());
            ps.setFloat(4, product.getProduct_price());
            ps.setString(5, product.getProduct_describe());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getImg());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        String sql1 = "INSERT INTO product_size (product_id,size) VALUES(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Size i : product.getSize()) {
                ps = conn.prepareStatement(sql1);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getSize());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        String sql2 = "INSERT INTO product_color (product_id,color) VALUES(?,?)";
        try {
            conn = new DBContext().getConnection();
            for (Color i : product.getColor()) {
                ps = conn.prepareStatement(sql2);
                ps.setString(1, i.getProduct_id());
                ps.setString(2, i.getColor());
                ps.executeUpdate();
            }
        } catch (Exception e) {

        }
        String sql3 = "INSERT INTO product_active (product_id,active) VALUES(?,?)";
        try {
            conn = new DBContext().getConnection();
            Product_Active i = product.getActive();
            ps = conn.prepareStatement(sql3);
            ps.setString(1, product.getProduct_id());
            ps.setString(2, i.getAcitve());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT 
                        c.category_name 
                     ,  p.product_id 
                     ,  p.product_name
                     ,  p.product_price
                     ,  p.product_describe
                     ,  p.quantity,p.img
                     ,  p.category_id 
                     FROM  product p 
                     INNER JOIN category c on p.category_id = c.category_id
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(8), rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Size> getSize() {
        List<Size> list = new ArrayList<>();
        String sql = "SELECT * FROM product_size";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Color> getColor() {
        List<Color> list = new ArrayList<>();
        String sql = "SELECT * FROM product_color";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product_Active> getActive(){
        List<Product_Active> list = new ArrayList<>();
         String sql = "SELECT * FROM product_active";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product_Active(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
     public Category getCategoryByName(String name) {
        String sql = "SELECT * FROM Category where category_name = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
     public void ProductDelete(String product_id) {
        String sql = "DELETE FROM product_size WHERE product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql1 = "DELETE FROM product_color WHERE product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql1);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sql2 = "DELETE FROM product_img WHERE product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql2);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

        String sq3 = "DELETE FROM product WHERE product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sq3);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        String sql4 ="DELETE FROM product_active WHERE product_id=?";
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql4);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
     public void updateProduct(Product product, int cid, List<Color> listColor, List<Size> listSize) {
        try {
            // Update product details
            String sql = ""
                    + "UPDATE product "
                    + "SET category_id=?"
                    + ", product_name=?"
                    + ", product_price=?"
                    + ", product_describe=?"
                    + ", quantity=?" 
                    + (!product.getImg().equalsIgnoreCase("images/") ? ", img=?" : "") 
                    + " WHERE product_id=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setString(2, product.getProduct_name());
            ps.setFloat(3, product.getProduct_price());
            ps.setString(4, product.getProduct_describe());
            ps.setInt(5, product.getQuantity());
            if (!product.getImg().isEmpty()) {
                ps.setString(6, product.getImg());
            }
            ps.setString(!product.getImg().equalsIgnoreCase("images/") ? 7 : 6, product.getProduct_id());
            ps.executeUpdate();

            // Delete existing sizes and colors and actives
            String deleteSizesSQL = "DELETE FROM product_size WHERE product_id=?";
            ps = conn.prepareStatement(deleteSizesSQL);
            ps.setString(1, product.getProduct_id());
            ps.executeUpdate();

            String deleteColorsSQL = "DELETE FROM product_color WHERE product_id=?";
            ps = conn.prepareStatement(deleteColorsSQL);
            ps.setString(1, product.getProduct_id());
            ps.executeUpdate();
             String deleteActiveSQL = "DELETE FROM product_active WHERE product_id=?";
            ps = conn.prepareStatement(deleteActiveSQL);
            ps.setString(1, product.getProduct_id());
            ps.executeUpdate();
            // Insert new sizes
            String insertSizeSQL = "INSERT INTO product_size (product_id, size) VALUES (?, ?)";
            for (Size size : listSize) {
                ps = conn.prepareStatement(insertSizeSQL);
                ps.setString(1, product.getProduct_id());
                ps.setString(2, size.getSize());
                ps.executeUpdate();
            }
            //Insert new Active
            String insertActiveSQL = "INSERT INTO product_active (product_id, active) VALUES (?, ?)";
            ps = conn.prepareStatement(insertActiveSQL);
            ps.setString(1, product.getProduct_id());
            ps.setString(2, product.getActive().getAcitve());
            ps.executeUpdate();
        
            // Insert new colors
            String insertColorSQL = "INSERT INTO product_color (product_id, color) VALUES (?, ?)";
            for (Color color : listColor) {
                ps = conn.prepareStatement(insertColorSQL);
                ps.setString(1, product.getProduct_id());
                ps.setString(2, color.getColor());
                ps.executeUpdate();
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     public List<Product> getProductA() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name ,  p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img, p.category_id from  \n"
                + "product p inner join category c on p.category_id = c.category_id inner join product_active pa on pa.product_id = p.product_id Where pa.active='True'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(8), rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    ////

    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 10 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join product_active pa on pa.product_id = p.product_id Where pa.active ='True' ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTrendProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 5 p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join bill_detail bd on p.product_id = bd.product_id inner join product_active pa on pa.product_id = p.product_id Where pa.active ='True' \n"
                + "ORDER BY bd.quantity DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getNewProducts(int limit) {;
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP  p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.img FROM product p inner join bill_detail bd on p.product_id = bd.product_id\n"
                + "ORDER BY bd.quantity";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1));
                list.add(new Product(c, rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        productDAO dao = new productDAO();

        List<Category> top10Products = dao.getCategory();

        // Print the details of each top 10 product
        for (Category product : top10Products) {
            System.out.println("Product ID: " + product.getCategory_id());
            System.out.println("Product Name: " + product.getCategory_name());
            System.out.println("----------------------------------");
        }
    }
}
