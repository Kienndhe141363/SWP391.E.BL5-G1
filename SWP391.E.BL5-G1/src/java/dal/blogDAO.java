/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Timestamp;
import model.User;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Album;
import model.Blog;
import model.BlogCmt;

import model.Category;
import model.Product_Active;

public class blogDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Blog> getList() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM blog";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Long blogId = rs.getLong("blog_id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String content = rs.getString("content");
                java.util.Date createdAt = rs.getTimestamp("created_at");
                java.util.Date updatedAt = rs.getTimestamp("updated_at");
                Long userId = rs.getLong("user_id");
                String images = rs.getString("images");

                Blog blog = new Blog(blogId, title, summary, content, createdAt, updatedAt, userId, images);
                list.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace(); // It's good practice to log the exception
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Log any exceptions that occur during resource cleanup
            }
        }
        return list;
    }

    public List<Blog> getBlogsByBlogId(int blogId) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM blog WHERE blog_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setLong(1, blogId); // Set giá trị cho tham số truy vấn
            rs = ps.executeQuery();
            while (rs.next()) {
                Long id = rs.getLong("blog_id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String content = rs.getString("content");
                java.util.Date createdAt = rs.getTimestamp("created_at");
                java.util.Date updatedAt = rs.getTimestamp("updated_at");
                Long userId = rs.getLong("user_id");
                String images = rs.getString("images");

                Blog blog = new Blog(id, title, summary, content, createdAt, updatedAt, userId, images);
                list.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
        return list;
    }

    public void addBlog(String title, String summary, String content, Date createdAt, Date updatedAt, int user_id, String images) {
        String sql = "INSERT INTO blog (title, summary, content, created_at, updated_at, user_id, images) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, summary);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);
            ps.setInt(6, user_id);
            ps.setString(7, images);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
    }

    public void updateBlog(int blogId, String title, String summary, String content, java.util.Date createdAt, java.util.Date updatedAt, int userId, String images) {
        String sql = "UPDATE blog SET title = ?, summary = ?, content = ?, created_at = ?, updated_at = ?, user_id = ?, images = ? WHERE blog_id = ?";
        try {
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);

            // Thiết lập giá trị cho các tham số
            ps.setString(1, title);
            ps.setString(2, summary);
            ps.setString(3, content);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);
            ps.setInt(6, userId);
            ps.setString(7, images);
            ps.setInt(8, blogId); // Tham số cuối cùng để xác định blog cần cập nhật

            ps.executeUpdate(); // Thực thi câu lệnh SQL để cập nhật
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }
    }

    public void BlogDelete(String blog_id) {
        String sql = "DELETE FROM blog WHERE blog_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, blog_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void BlogCommentDelete(int commentId) {
        String sql = "DELETE FROM blog_comment WHERE comment_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, commentId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateBlogComment(int blog_id, Long user_id, String comment_text, java.util.Date created_at, java.util.Date updated_at, Long comment_id) {
        try {
            String sql = "UPDATE blog_comment SET blog_id = ?, user_id = ?, comment_text = ?, created_at = ?, updated_at = ? WHERE comment_id = ?";
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            ps.setLong(2, user_id);
            ps.setString(3, comment_text);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);
            ps.setLong(6, comment_id); // Tham số cuối cùng để xác định bình luận cần cập nhật
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }
    }

    public List<BlogCmt> getListBlogComment(int blogId) {
        List<BlogCmt> comments = new ArrayList<>();
        String sql = "SELECT * FROM blog_comment WHERE blog_id = ?";
        try {
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);
            ps.setLong(1, blogId); // Thiết lập tham số blogId cho câu lệnh SQL

            rs = ps.executeQuery(); // Thực thi câu lệnh SQL và lấy kết quả

            // Xử lý kết quả trả về từ câu lệnh SQL
            while (rs.next()) {
                // Tạo đối tượng BlogComment từ kết quả của từng dòng
                BlogCmt comment = new BlogCmt(
                        rs.getLong("comment_id"),
                        rs.getLong("blog_id"),
                        rs.getLong("user_id"),
                        rs.getString("comment_text"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                );
                comments.add(comment); // Thêm đối tượng BlogComment vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
        return comments; // Trả về danh sách các bình luận
    }

    public void addComment(int blogId, int userId, String commentText, Date createdAt, Date updatedAt) {
        String sql = "INSERT INTO blog_comment (blog_id, user_id, comment_text, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";
        try {
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);
            // Thiết lập giá trị cho các tham số
            ps.setInt(1, blogId);
            ps.setInt(2, userId);
            ps.setString(3, commentText);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);

            ps.executeUpdate(); // Thực thi câu lệnh SQL để thêm bình luận
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
    }

}
