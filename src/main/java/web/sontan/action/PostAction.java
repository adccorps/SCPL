package web.sontan.action;

import cn.hutool.core.util.IdUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Post;
import web.sontan.model.User;
import web.sontan.service.PostService;

import java.util.Map;

/**
 * 类{@link PostAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("postAction")
@Scope("prototype")
public class PostAction extends ActionSupport implements SessionAware {

    private static final long serialVersionUID = 865623217856999730L;
    @Autowired
    private PostService postService;
    private Post post;

    private Map<String, Object> session;

    public String add() {
        this.post.setPostId(IdUtil.simpleUUID()); // 设置post_id
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.addPost(this.post);
        return "json";
    }

    public String modify() {
        this.post.getPostId(); // TODO postId怎么拿到????
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.modifyPost(this.post);
        return "json";
    }

    public String delete() {
        this.post.getPostId(); // TODO postId怎么拿到????
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.deletePost(this.post);
        return "json";
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }
}