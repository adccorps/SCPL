package web.sontan.action;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.util.IdUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.User;
import web.sontan.service.UserService;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 类{@link UserAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements SessionAware {

    private static final long serialVersionUID = -3978635263669732177L;
    @Resource
    private UserService userService;
    private User user;
    private Map<String, Object> session;

    private String oldPassword;
    private String oldPhone;

    private int code;
    private String tip;

    public String login() {
        User user = userService.login(this.user);
        session.put("user", user);
        if (user == null) {
            tip = "账号或密码错误！";
            code = -1;
        } else {
            code = 1;
        }
        this.user = null;
        return "json";
    }

    public String register() {
        user.setUserId(IdUtil.simpleUUID());
        boolean flag = userService.register(user);
        if (!flag) {
            tip = "注册失败，请检查您的信息后重试！";
            code = -1;
        } else {
            code = 1;
        }
        this.user = null;
        return "json";
    }

    public String update() {
        User user = (User) session.get("user");
        this.user.setUserId(user.getUserId());
        boolean flag = userService.update(this.user);
        if (!flag) {
            tip = "修改失败";
            code = -1;
        } else {
            code = 1;
            // 说明修改成功，可以直接复制用户输入的属性到原来的user里面
            BeanUtil.copyProperties(this.user, user, CopyOptions.create().setIgnoreNullValue(true).setIgnoreError(true)); // 复制用户输入的非空属性到session中的user
            session.put("user", user);
        }

        this.user = null;
        return "json";
    }

    public String logout() {
        session.remove("user");
        return "index";
    }

    public String updatePassword() {
        User user = (User) session.get("user");
        if (user.getUserPass().equals(this.user.getUserPass())) {
            tip = "原密码和新密码不可以相同，请重新输入！";
            code = -3;
        } else if (user.getUserPass().equals(this.oldPassword)) {
            this.user.setUserId(user.getUserId());
            boolean flag = userService.update(this.user);
            if (!flag) {
                tip = "修改失败";
                code = -1;
            } else {
                code = 1;
                BeanUtil.copyProperties(this.user, user, CopyOptions.create().setIgnoreNullValue(true).setIgnoreError(true)); // TODO 前端不需要显示，安全考虑应该不写
                session.put("user", user);
            }
        } else {
            tip = "原密码输入错误！请重试！";
            code = -2;
        }

        this.user = null;
        this.oldPassword = null;
        return "json";
    }

    public String updatePhone() {
        User user = (User) session.get("user");
        if (user.getUserPass().equals(this.user.getUserPass())) {
            if (user.getUserPhone().equals(this.oldPhone)) {
                this.user.setUserId(user.getUserId());
                this.user.setUserPass(null);
                boolean flag = userService.update(this.user);
                if (!flag) {
                    tip = "修改失败";
                    code = -1;
                } else {
                    code = 1;
                    BeanUtil.copyProperties(this.user, user, CopyOptions.create().setIgnoreNullValue(true).setIgnoreError(true));
                    session.put("user", user);
                }
            } else {
                code = -2;
                tip = "原手机号输入错误！请重试！";
            }
        } else {
            code = -3;
            tip = "密码输入错误！请重试！";
        }
        return "json";
    }

    public String checkUserPhone() { // 注册登录检验
        User user = userService.findByPhone(this.user.getUserPhone());

        if (user == null) {
            code = 1;
        } else {
            tip = "手机号不可用";
            code = -1;
        }
        this.user = null;
        return "json";
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getOldPhone() {
        return oldPhone;
    }

    public void setOldPhone(String oldPhone) {
        this.oldPhone = oldPhone;
    }

    public Map<String, Object> getSession() {
        return session;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}
