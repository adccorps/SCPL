package web.sontan.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import web.sontan.model.User;

/**
 * 类{@link Logined}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */

public class Logined implements Interceptor {

    private static final long serialVersionUID = 659482653405478456L;

    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        User user = (User) ActionContext.getContext().getSession().get("user");
        ActionMapping actionMapping = (ActionMapping) ActionContext.getContext().getValueStack().getContext().get("struts.actionMapping");
        if (user != null && (actionMapping.getName().equals("login") || actionMapping.getName().equals("register"))){ // 已经登录后，不允许进入登录/注册页面
            return "index";
        }
        return actionInvocation.invoke();
    }
}
