package web.sontan.action;


import com.bastengao.struts2.freeroute.Results;
import com.bastengao.struts2.freeroute.annotation.MethodType;
import com.bastengao.struts2.freeroute.annotation.Route;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Find;
import web.sontan.model.Post;
import web.sontan.model.User;
import web.sontan.service.FindService;
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
@Controller("findAction")
@Scope("prototype")
public class FindAction extends ActionSupport {
    @Resource
    private FindService findService;
    private List<Find> findList;
    private Find find;
    private int findPage;
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    private String[] files;


    private String[] picAddress;

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    private int view;


    public int getFindPage() {
        return findPage;
    }

    public void setFindPage(int findPage) {
        this.findPage = findPage;
    }

    private int totalPages;

    public void setGoodsList(List<Find> findList) {
        this.findList = findList;
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
    public String indexShowView() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        view = -1;
        session.put("view", view);
        return SUCCESS;
    }

    public String showView() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("view", view);
        return SUCCESS;
    }

    public String tableView() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        view = Integer.parseInt(session.get("view").toString());
        if (view != -1) {
            findList = findService.findFinds(findPage, view);
        } else {   //主展示
            findList = findService.findAllFinds(findPage);
        }
        PageInfo<Find> postPageInfo = new PageInfo<>(this.findList);
        this.totalPages = postPageInfo.getPages();
        return "json";
    }

    //    public String addFind(){
//        ActionContext actionContext = ActionContext.getContext();
//        Map session = actionContext.getSession();
//
//        User user = (User)session.get("user");
//        System.out.println("USERID:"+user.getUserId());
//        System.out.println("find的值："+find+"\n"+find.getAdders());
//        if(findService.addFinds(find,user.getUserId())) {
//            System.out.println("插入成功");
//        }else System.out.println("插入失败");
//        return SUCCESS;
//    }
//
    public String addFind() {
        ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        System.out.println("进入addFine");
        System.out.println("find的值：" + find);
        System.out.println("find的desc：" + find.getDesc());

        StringBuffer curPic = new StringBuffer();     //图片存储
        for (int i = 0; i < files.length; i++) {
            System.out.println(files[i]);
            curPic = curPic.append(files[i]);
            curPic.append(",");
        }
        System.out.println("find图片" + curPic.toString());
        this.find.setPicUrl(curPic.toString());

        User user = (User) session.get("user");
        System.out.println("user的值：" + user.getUserId());
        findService.addFinds(find, user.getUserId());

        return "json";
    }

    public String testadd() {
        System.out.println("null:" + find);
        return "json";
    }

    @Route(value = "/post/{query}/page/{pageNum}", method = {MethodType.GET})
    public String search() {
       // this.posts = postService.findByString(pageNum, query, OrderType.DESC);
      //  PageInfo<Post> postPageInfo = new PageInfo<>(this.posts);
       // this.totalPages = postPageInfo.getPages();
        return Results.json().done();
    }








    public List<Find> getFindList() {
        return findList;
    }

    public void setFindList(List<Find> findList) {
        this.findList = findList;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
}