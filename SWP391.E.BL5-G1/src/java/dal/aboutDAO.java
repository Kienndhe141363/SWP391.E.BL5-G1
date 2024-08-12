/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.About;

/**
 *
 * @author ThangNPHE151263
 */
public class aboutDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<About> getAbout() {
        List<About> list = new ArrayList<>();
        String sql = "Select * From About";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new About(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void addAbout(String title, String img, String content) {
        String sql = "INSERT INTO [dbo].[About]\n"
                + "           ([Title]\n"
                + "           ,[ImageURL]\n"
                + "           ,[Content])\n"
                + "     VALUES(?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, img);
            ps.setString(3, content);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteAbout(String AboutId) {
        String sql = "DELETE FROM [dbo].[About] Where AboutId= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, AboutId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateAbout(About about) {
        try {
            // Update product details
            String sql = "UPDATE About SET Title=?,Content=?" + (!about.getImg().equalsIgnoreCase("images/") ? ", ImageURL=?" : "") + " WHERE AboutId=? ";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, about.getTitle());
            ps.setString(2, about.getContent());
            if (!about.getImg().isEmpty()) {
                ps.setString(3, about.getImg());
            }
            ps.setString(!about.getImg().equalsIgnoreCase("images/") ? 4 : 3, about.getAboutId());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
      public About getAboutById(String aboutId) {
        About about = null;
        String sql = "SELECT * FROM about WHERE AboutId = ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, aboutId);
            rs = ps.executeQuery();
            if (rs.next()) {
                about = new About(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return about;
    }
}
