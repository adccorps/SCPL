package web.sontan.action;

import cn.hutool.core.util.IdUtil;
import com.bastengao.struts2.freeroute.Results;
import com.bastengao.struts2.freeroute.annotation.ControllerPackage;
import com.bastengao.struts2.freeroute.annotation.Route;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Post;
import web.sontan.model.User;
import web.sontan.model.VO.PostVO;
import web.sontan.service.PostService;
import web.sontan.utils.sql.OrderType;

import java.util.List;
import java.util.Map;

/**
 * 类{@link PostAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("postAction")
@Scope("prototype")
@ControllerPackage(parent = "post")
public class PostAction extends ActionSupport implements SessionAware {

    private static final long serialVersionUID = 865623217856999730L;
    @Autowired
    private PostService postService;
    private PostVO post;
    private String postId;

    private List<Post> posts;

    private Map<String, Object> session;

    public String add() {
        this.post.setPostId(IdUtil.simpleUUID()); // 设置post_id
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.addPost(this.post);
        return flag ? "json" : "";
    }

    public String modify() {
        this.post.getPostId(); // TODO postId怎么拿到????
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.modifyPost(this.post);
        return flag ? "json" : "";
    }

    public String delete() {
        this.post.getPostId(); // TODO postId怎么拿到????
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.deletePost(this.post);
        return flag ? "json" : "";
    }

    @Route(value = "/post/modify/{postId}", interceptors = {"nologin"})
    public String viewModify() {
        this.post = postService.findById(postId);
        User user = (User) session.get("user");
        if (this.post.getUser().getUserId().equals(user.getUserId())) {
            return Results.jsp("/WEB-INF/post/modify.jsp");
        } else {
            return Results.redirect("/post");
        }
    }

    @Route(value = "/post")
    public String viewIndex() {
        this.posts = postService.findAll(OrderType.DESC); // TODO 分页
        return Results.jsp("/WEB-INF/post/index.jsp");
    }

    @Route(value = "/post/view/{postId}")
    public String viewPost() {
        this.post = postService.findById(postId);
        return Results.jsp("/WEB-INF/post/post.jsp");
    }

    public PostVO getPost() {
        return post;
    }

    public void setPost(PostVO post) {
        this.post = post;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }
}