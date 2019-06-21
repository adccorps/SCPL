package web.sontan.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 类{@link NoLoginAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("noLoginAction")
@Scope("prototype")
public class NoLoginAction extends ActionSupport {

    private static final long serialVersionUID = 8354476606570132762L;
    private int code;
    private String tip;
    private String action;

    @Override
    public String execute() throws Exception {
        code = -10;
        tip = "你还没有登录哦!";
        action = ServletActionContext.getServletContext().getContextPath() + "/login?error=-1";
        return "json";
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
