package web.sontan.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by Wang on 2019/5/17.
 */
@Controller("shopAction")
@Scope("prototype")
public class ShopAction extends ActionSupport{

    public String viewIndex()  {
        return SUCCESS;
    }
}
