package web.sontan.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import web.sontan.model.User;

/**
 * 类{@link NoLogin}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class NoLogin implements Interceptor {

    private static final long serialVersionUID = 1403294615131659598L;

    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        User user = (User) ActionContext.getContext().getSession().get("user");
        if (user == null) { // 未登录用户不允许访问
            return "index";
        }
        return actionInvocation.invoke();
    }
}
