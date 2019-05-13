package web.sontan.model;

/**
 * 类{@link Post}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class Post {

    private String postId;
//    private String userId; // 外键
    private String postType; // 贴子类型????
    private String postTitle;
    private String postContent;
    private String createTime;
    private Integer postStatus;

    private User user;

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Integer getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(Integer postStatus) {
        this.postStatus = postStatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postId='" + postId + '\'' +
                ", postType='" + postType + '\'' +
                ", postTitle='" + postTitle + '\'' +
                ", postContent='" + postContent + '\'' +
                ", createTime='" + createTime + '\'' +
                ", postStatus='" + postStatus + '\'' +
                ", user=" + user +
                '}';
    }
}
