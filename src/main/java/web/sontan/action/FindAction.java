package web.sontan.action;


import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Find;
import web.sontan.service.FindService;
import javax.annotation.Resource;
import java.util.List;


/**
 * 类{@link PostAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("findAction")
@Scope("prototype")
public class FindAction extends ActionSupport  {
    @Resource
    private FindService findService;
    private List<Find> findlist;
    private int ipage;
    private int Status;
    private Find find;

    public List<Find> getFindList() {
        return findlist;
    }
    public void setGoodsList(List<Find> findList) {
        this.findlist = findlist;
    }

    public Find getFind() {
        return find;
    }
    public void setFind(Find find) {
        this.find = find;
    }

    /*
     * 跳转页面action
     * */
    public String showView() {
        return SUCCESS;
    }

    public String tableView(){
        findlist = findService.findFinds(10,1);
        if(findlist==null)
            System.out.println("not null");
        else System.out.println("FindAction 里面的this findlist is:"+findlist.get(0).getFindId());//测试
        return SUCCESS;
    }

    public List<Find> getFindlist() {
        return findlist;
    }

    public void setFindlist(List<Find> findlist) {
        this.findlist = findlist;
    }

}