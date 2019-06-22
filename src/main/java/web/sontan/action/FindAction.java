package web.sontan.action;


import com.bastengao.struts2.freeroute.Results;
import com.bastengao.struts2.freeroute.annotation.ControllerPackage;
import com.bastengao.struts2.freeroute.annotation.MethodType;
import com.bastengao.struts2.freeroute.annotation.Route;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Find;
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
@ControllerPackage(parent = "find")
public class FindAction extends ActionSupport {
    @Resource
    private FindService findService;
    private List<Find> findList;
    private Find find;
    private int findPage;
    private String title;
    private String query;
    private String find_id;
    private int code;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getFind_id() {
        return find_id;
    }

    public void setFind_id(String find_id) {
        this.find_id = find_id;
    }

    ActionContext actionContext = ActionContext.getContext();
    Map session = actionContext.getSession();
    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    private String[] files;

    public String[] getFiles() {
        return files;
    }

    public void setFiles(String[] files) {
        this.files = files;
    }

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
        view = -1;
        session.put("view", view);
        User user1 = (User)session.get("user");
        if(user1!=null)
        if(user1.getUserName().equals("admin")){return "admin";}
        return SUCCESS;
    }

    public  String personal(){
        view = 10;
        session.put("view",view);
        return  SUCCESS;
    }

    public String showView() {
        session.put("view", view);
        return SUCCESS;
    }

    public String tableView() {
        view = Integer.parseInt(session.get("view").toString());
        if (view != -1 && view !=10) {
            findList = findService.findFinds(findPage, view);
        }
        else if(view ==10){
            User user =(User)session.get("user");
            findList = findService.ShowUserOp(findPage,user.getUserId());
            if(findList != null){
                return "json";
            }
        }
        else {   //主展示
            findList = findService.findAllFinds(findPage);
        }
        PageInfo<Find> postPageInfo = new PageInfo<>(this.findList);
        this.totalPages = postPageInfo.getPages();
        return "json";
    }

    public String addSing() {   //
        System.out.println("进来了");
        User user = (User) session.get("user");
        System.out.println("user的值：" + user.getUserId());
        if(findService.addFinds(find, user.getUserId()));
        return "json";
    }


    public String addFind() {   //
        System.out.println("进来了");
        StringBuffer curPic = new StringBuffer();     //图片存储
        for (int i = 0; i < files.length; i++) {
            curPic = curPic.append(files[i]);
            curPic.append(",");
        }
        System.out.println("xxx"+curPic.toString());
        this.find.setPicUrl(curPic.toString());
        User user = (User) session.get("user");
        System.out.println("user的值：" + user.getUserId());
        if(findService.addFinds(find, user.getUserId()))
        {
            System.out.println("成");
            return "json";}
        else {
            System.out.println("败");
            return "json";}
    }

    public  String changeStatus(){  //成功
        User user = (User)session.get("user");
        System.out.println("userid:"+user.getUserId());
        Find find = (Find)session.get("find");
        if(findService.modifyPeriodToEnd(find.getFindId(),user.getUserId())){
            System.out.println("修改状态成功");
            code = 1;
        }
        else code=-1;
        return  "json";
    }
    public  String toend(){
        User user = (User)session.get("user");
        System.out.println("userid:"+user.getUserId());
        Find find = (Find)session.get("find");
        if(findService.TOend(find.getFindId(),user.getUserId())){
            System.out.println("修改状态成功");
            code = 1;
        }
        else code=-1;
        return "json";
    }

    public  String yijian(){
        User user = (User)session.get("user");
        System.out.println("userid:"+user.getUserId());
        Find find = (Find)session.get("find");
        if(findService.yijian(find.getFindId(),user.getUserId())){
            System.out.println("修改状态成功");
            code = 1;
        }
        else code=-1;
        return "json";
    }

    public String lookFind(){   //成功
        Integer x =Integer.parseInt(find_id);
        find = findService.lookFind(x).get(0);
        session.put("find",find);
        return  "success";
    }


    @Route(value = "/find/{query}/page/{findPage}", method = {MethodType.GET})
    public String search() {        //成功
        findList = findService.findBySearch(findPage, query, OrderType.DESC);
        PageInfo<Find> postPageInfo = new PageInfo<>(this.findList);
        System.out.println(findList);
        this.totalPages = postPageInfo.getPages();
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