package model;

import java.util.Date;

public class Blog {
    private Long blogId;
    private String title;
    private String summary;
    private String content;
    private Date createdAt;
    private Date updatedAt;
    private Long user_id;
    private String images;

    // Default constructor
    public Blog() {}

    // Parameterized constructor
    public Blog(Long blogId, String title, String summary, String content, Date createdAt, Date updatedAt, Long user_id, String images) {
        this.blogId = blogId;
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.user_id = user_id;
        this.images = images;
    }

    // Getter and Setter for blogId
    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    // Getter and Setter for title
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    // Getter and Setter for summary
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    // Getter and Setter for content
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    // Getter and Setter for createdAt
    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    // Getter and Setter for updatedAt
    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    // Getter and Setter for userId
    public Long getUserId() {
        return user_id;
    }

    public void setUserId(Long userId) {
        this.user_id = userId;
    }

    // Getter and Setter for images
    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
