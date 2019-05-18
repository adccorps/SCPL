package web.sontan.model;

/**
 * 类{@link Reply}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class Reply {

    private String replyId;
//    private String userId;
//    private String postId;
//    private String previousId;
    private String replyContent;
    private String replyTime;
    private Integer replyStatus;

    private User user;
    private Post post;
    private Reply previous;

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    public Integer getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(Integer replyStatus) {
        this.replyStatus = replyStatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Reply getPrevious() {
        return previous;
    }

    public void setPrevious(Reply previous) {
        this.previous = previous;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "replyId='" + replyId + '\'' +
                ", replyContent='" + replyContent + '\'' +
                ", replyTime='" + replyTime + '\'' +
                ", replyStatus=" + replyStatus +
                '}';
    }
}
