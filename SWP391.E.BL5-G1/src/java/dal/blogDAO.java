/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import util.DateUtil;

/**
 *
 * @author hieupham
 */
public class blogDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Blog> getBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = """
                    SELECT [blog_id]
                          ,[title]
                          ,[summary]
                          ,[content]
                          ,[created_at]
                          ,[updated_at]
                          ,[user_id]
                          ,[images]
                    FROM [dbo].[blog]
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        new userDAO().getByID(rs.getInt(7)),
                        rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println("getBlog: " + e.getMessage());
        }
        return list;
    }

    public Blog getBlogByID(int blog_id) {
        Blog blog = null;
        String sql = """
                    SELECT [blog_id]
                          ,[title]
                          ,[summary]
                          ,[content]
                          ,[created_at]
                          ,[updated_at]
                          ,[user_id]
                          ,[images]
                    FROM [dbo].[blog]
                    WHERE blog_id = ?
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                blog = new Blog(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        new userDAO().getByID(rs.getInt(7)),
                        rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("getBlog: " + e.getMessage());
        }
        return blog;
    }

    public void insertBlog(Blog blog) {
        String sql = """
                    INSERT INTO [dbo].[blog]
                               ([title]
                               ,[summary]
                               ,[content]
                               ,[created_at]
                               ,[updated_at]
                               ,[user_id]
                               ,[images])
                         VALUES (?,?,?,?,?,?,?)
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setNString(1, blog.getTitle());
            ps.setNString(2, blog.getSummary());
            ps.setNString(3, blog.getContent());
            ps.setDate(4, DateUtil.convertFromJAVADateToSQLDate(blog.getCreated_at()));
            ps.setDate(5, DateUtil.convertFromJAVADateToSQLDate(blog.getUpdated_at()));
            ps.setInt(6, blog.getUser().getUser_id());
            ps.setString(7, blog.getImages());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertBlog: " + e.getMessage());
        }
    }

    public void updateBlog(Blog blog) {
        String sql = """
                    UPDATE [dbo].[blog]
                            SET [title] = ?
                               ,[summary] = ?
                               ,[content] = ?
                               ,[created_at] = ?
                               ,[updated_at] = ?
                               ,[user_id] = ?
                               ,[images] = ?
                         WHERE [blog_id] = ?
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setNString(1, blog.getTitle());
            ps.setNString(2, blog.getSummary());
            ps.setNString(3, blog.getContent());
            ps.setDate(4, DateUtil.convertFromJAVADateToSQLDate(blog.getCreated_at()));
            ps.setDate(5, DateUtil.convertFromJAVADateToSQLDate(blog.getUpdated_at()));
            ps.setInt(6, blog.getUser().getUser_id());
            ps.setString(7, blog.getImages());
            ps.setInt(8, blog.getBlog_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertBlog: " + e.getMessage());
        }
    }

    public void deleteBlog(int blog_id) {

        String sql = "DELETE FROM blog WHERE blog_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

