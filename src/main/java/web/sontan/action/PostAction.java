package web.sontan.action;

import cn.hutool.core.util.IdUtil;
import com.bastengao.struts2.freeroute.Results;
import com.bastengao.struts2.freeroute.annotation.ControllerPackage;
import com.bastengao.struts2.freeroute.annotation.MethodType;
import com.bastengao.struts2.freeroute.annotation.Route;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Post;
import web.sontan.model.User;
import web.sontan.model.VO.PostVO;
import web.sontan.service.PostService;
import web.sontan.utils.sql.OrderType;

import javax.annotation.Resource;
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
    @Resource
    private PostService postService;
    private PostVO post;
    private String postId;
    private Integer code;
    private String tip;
    private int pageNum;
    private int totalPages;
    private String query;

    private List<Post> posts;

    private Map<String, Object> session;

    public String add() {
        this.post.setPostId(IdUtil.simpleUUID()); // 设置post_id
        User user = (User) session.get("user");
        this.post.setUser(user);
        boolean flag = postService.addPost(this.post);
        code = flag ? 1 : -1;
        tip = flag ? "回复成功" : "回复失败";
        return "json";
    }

    public String modify() {
        if (!isMatchedUser()) return "json";
        boolean flag = postService.modifyPost(this.post);
        code = flag ? 1 : -1;
        tip = flag ? "修改成功" : "修改失败";
        return "json";
    }

    private boolean isMatchedUser() {
        User user = (User) session.get("user");
        PostVO postVO = postService.findById(this.post.getPostId());
        if (!postVO.getUser().getUserId().equals(user.getUserId())) {
            code = -2;
            tip = "404";
            return false;
        }
        return true;
    }

    public String delete() {
        if (!isMatchedUser()) return "json";
        boolean flag = postService.deletePost(this.post);
        code = flag ? 1 : -1;
        tip = flag ? "删除成功" : "删除失败";
        return "json";
    }

    @Route(value = "/post/modify/{postId}", interceptors = {"nologinRedirect"})
    public String viewModify() {
        this.post = postService.findById(postId);
        User user = (User) session.get("user");
        if (!this.post.getUser().getUserId().equals(user.getUserId())) {
            return Results.jsp("/WEB-INF/404.jsp");
        }
        return Results.jsp("/WEB-INF/post/modify.jsp");
    }

    @Route(value = "/post")
    public String viewIndex() {
        /*
            默认为1
         */
        int pageNum = 1;
        this.posts = postService.findAll(pageNum, OrderType.DESC);
        PageInfo<Post> postPageInfo = new PageInfo<>(this.posts);
        this.totalPages = postPageInfo.getPages();
        return Results.jsp("/WEB-INF/post/index.jsp");
    }

    @Route(value = "/post/view/{postId}")
    public String viewPost() {
        this.post = postService.findById(postId);
        if (this.post == null) {
            return Results.jsp("/WEB-INF/404.jsp");
        }
        return Results.jsp("/WEB-INF/post/post.jsp");
    }

    @Route(value = "/post/page/{pageNum}", method = {MethodType.GET})
    public String pagination() {
        this.posts = postService.findAll(pageNum, OrderType.DESC);
        PageInfo<Post> postPageInfo = new PageInfo<>(this.posts);
        this.totalPages = postPageInfo.getPages();
        return Results.json().done();
    }

    @Route(value = "/post/{query}/page/{pageNum}", method = {MethodType.GET})
    public String search() {
        this.posts = postService.findByString(pageNum, query, OrderType.DESC);
        PageInfo<Post> postPageInfo = new PageInfo<>(this.posts);
        this.totalPages = postPageInfo.getPages();
        return Results.json().done();
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
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

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }
}