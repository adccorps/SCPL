package web.sontan.model;

import java.util.Date;

/**
 * Created by 0 on 2019/5/26.
 */
public class Dynamic {
    private int dynamicId;
    private Date date;
    private int likes;
    private int picCount;
    private String picAddress;
    private int commentCount;
    private String content;
    private User user;
    private Comment comment;
    private String state;
    private Collections collections;

    public int getDynamicId() {
        return dynamicId;
    }

    public void setDynamicId(int dynamicId) {
        this.dynamicId = dynamicId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public int getPicCount() {
        return picCount;
    }

    public void setPicCount(int picCount) {
        this.picCount = picCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public String getPicAddress() {
        return picAddress;
    }

    public void setPicAddress(String picAddress) {
        this.picAddress = picAddress;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Collections getCollections() {
        return collections;
    }

    public void setCollections(Collections collections) {
        this.collections = collections;
    }

    @Override
    public String toString() {
        return "Dynamic{" +
                "dynamicId='" + dynamicId + '\'' +
                ", date=" + date +
                ", likes=" + likes +
                ", picCount=" + picCount +
                ", picAddress='" + picAddress + '\'' +
                ", commentCount=" + commentCount +
                ", content='" + content + '\'' +
                ", user=" + user +
                ", comment=" + comment +
                '}';
    }
}
