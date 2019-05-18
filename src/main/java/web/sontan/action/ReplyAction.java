package web.sontan.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 类{@link ReplyAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("replyAction")
@Scope("prototype")
public class ReplyAction extends ActionSupport {

    private static final long serialVersionUID = -8843827307006666641L;

    public String add() {

        return "json";
    }
}
