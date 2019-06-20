package web.sontan.action;

import cn.hutool.core.util.IdUtil;
import com.bastengao.struts2.freeroute.Results;
import com.bastengao.struts2.freeroute.annotation.ControllerPackage;
import com.bastengao.struts2.freeroute.annotation.MethodType;
import com.bastengao.struts2.freeroute.annotation.Route;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Reply;
import web.sontan.model.User;
import web.sontan.service.ReplyService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 类{@link ReplyAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("replyAction")
@Scope("prototype")
@ControllerPackage(parent = "reply")
public class ReplyAction extends ActionSupport implements SessionAware {

    private static final long serialVersionUID = -8843827307006666641L;
    @Resource
    private ReplyService replyService;
    private Reply reply;
    private Integer code;
    private String tip;
    private String replyId;
    private int pageNum;
    private String postId;
    private Integer totalPages;

    private Map<String, Object> session;
    private List<Reply> replies;

    public String add() {
        this.reply.setReplyId(IdUtil.simpleUUID());
        User user = (User) session.get("user");
        this.reply.setUser(user);
        boolean flag = replyService.addReply(this.reply);
        code = flag ? 1 : -1;
        tip = flag ? "回复成功" : "回复失败";
        return "json";
    }

    public String modify() {
        if (!isMatchedUser()) return "json";
        boolean flag = replyService.modifyReply(reply);
        code = flag ? 1 : -1;
        tip = flag ? "修改成功" : "修改失败";
        this.reply = flag ? replyService.findById(reply.getReplyId()) : null;
        return "json";
    }

    public String delete() {
        if (!isMatchedUser()) return "json";
        boolean flag = replyService.deleteReply(reply);
        code = flag ? 1 : -1;
        tip = flag ? "删除成功" : "删除失败";
        return "json";
    }

    private boolean isMatchedUser() {
        User user = (User) session.get("user");
        Reply reply = replyService.findById(this.reply.getReplyId());
        if (!reply.getUser().getUserId().equals(user.getUserId())) {
            code = -2;
            tip = "404";
            return false;
        }
        return true;
    }

    @Route(value = "/reply/modify/{replyId}", interceptors = {"nologinRedirect"})
    public String viewModify() {
        this.reply = replyService.findById(replyId);
        User user = (User) session.get("user");
        if (!this.reply.getUser().getUserId().equals(user.getUserId())) {
            return Results.jsp("/WEB-INF/404.jsp");
        }
        return Results.jsp("/WEB-INF/reply/modify.jsp");
    }

    @Route(value = "/reply/page/{pageNum}/{postId}", method = {MethodType.GET})
    public String pagination() {
        if (this.pageNum < 1) {
            this.pageNum = 1;
        }
        this.totalPages = 1;
        int count = replyService.count(this.postId);
        if (count > 9) {
            this.totalPages += (int) Math.ceil((count - 9) / 10.0); // 页数
        }
        this.replies = replyService.findLimit(this.pageNum, this.postId); // 该页的回复
        return Results.json().done();
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
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

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }
}
