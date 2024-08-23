/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.PostType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ThangNPHE151263
 */
public class postTypeDAO extends DBContext{
    public List<PostType> getAllPostTypes() throws Exception {
        List<PostType> postTypes = new ArrayList<>();
        String sql = "SELECT postTypeId, typeName FROM PostType";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PostType postType = new PostType(
                    rs.getInt("postTypeId"),
                    rs.getString("typeName")
                );
                postTypes.add(postType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postTypes;
    }
}
