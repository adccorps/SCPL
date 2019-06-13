package web.sontan.action;

import com.bastengao.struts2.freeroute.annotation.ControllerPackage;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Comment;
import web.sontan.model.Dynamic;
import web.sontan.model.User;
import web.sontan.service.AlumniCircleService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 0 on 2019/5/22.
 */
@Controller("alumniCircleAction")
@Scope("prototype")
public class AlumniCircleAction extends ActionSupport implements SessionAware {
    private String content;
    private String[] picAddress;
    private int dynamicId;
    private String userId;
    private String commentText;


    private Map<String, Object> session;
    @Resource
    private AlumniCircleService alumniCircleService;

    public String index() {
        System.out.println("indexAction");
        List<Dynamic> allCircle = alumniCircleService.findAllCircle();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setAttribute("allCircleList", allCircle);
        for (Dynamic dynamic : allCircle) {
            System.out.println(dynamic.toString());
        }
        session.setAttribute("max", allCircle.get(0).getDynamicId());//保存当前最新的动态的ID
        session.setAttribute("min", allCircle.get(allCircle.size() - 1).getDynamicId());//保存当前最旧的动态的ID
        //此单纯测试用
        System.out.println("最新的动态ID" + session.getAttribute("max"));
        System.out.println("旧动态ID" + session.getAttribute("min"));
        return SUCCESS;
    }

    public String loadMore() throws IOException {   //点击加载更多时，在增加十条动态
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int min = (int) session.getAttribute("min");   //找到当前的最旧的动态号
        List<Dynamic> moreCircle = alumniCircleService.findLoadMore(min);
        StringBuffer str = new StringBuffer();
        if (moreCircle.size() >= 1) {
            session.setAttribute("min", moreCircle.get(moreCircle.size() - 1).getDynamicId());//保存当前最旧的动态的ID
            for (Dynamic dynamic : moreCircle) {
                System.out.println(dynamic.toString());//测试用
                String[] picsaddress = dynamic.getPicAddress().split(";");
                String pics = "";
                if (dynamic.getPicCount() == 0) {
                    pics = "";
                } else if (dynamic.getPicCount() == 1) {
                    pics = pics + "<a href=\"http://10.2.16.131/images/" + dynamic.getPicAddress() + "\" target=\"_Blank\">" +
                            "<img src=\"http://10.2.16.131/images/" + dynamic.getPicAddress() + "\" alt=\"\" style=\"width: 300px;\">" +
                            "</a>";
                } else {
                    for (int i = 0; i < picsaddress.length; i++) {  //预先拿到所有图片的HTML代码
                        pics = pics + "<a href=\"http://10.2.16.131/images/" + picsaddress[i] + "\" target=\"_Blank\">" +
                                "<img src=\"http://10.2.16.131/images/" + picsaddress[i] + "\" alt=\"\">" +
                                "</a>";
                    }
                }
                str.append("<div class=\"card\" style=\"\">\n" +
                        "                <div class=\"card-body card-body-main\">\n" +
                        "                    <div class=\"row\">\n" +
                        "                        <div class=\"col-6 col-sm-1\"><a href=\"#\"><img src=\"" + dynamic.getUser().getUserAvatar() + "\" alt=\"头像\" class=\"rounded-circle touxiang\"></a></div>\n" +
                        "                        <div class=\"col-6 col-sm-3 user-info\">\n" +
                        "                            <a class=\"h6 font-weight-bold user-name\" href=\"${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=" + dynamic.getUser().getUserId() + "\">" + dynamic.getUser().getUserName() + "</a><br>\n" +
                        "                            <div class=\"time\">" + dynamic.getDate() + "</div>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                    <p class=\"card-text\">" + dynamic.getContent() + "</p>\n" +
                        "                    <div class=\"user-imgs baguetteBox\">\n");
                str.append(pics);
                str.append(
                        "                    </div>\n" +
                                "                    <div class=\"row\">\n" +
                                "                        <div class=\"col-12 col-sm-3\"><div class=\"zi zi_love\"></div><a href=\"#\" class=\"card-link\">" + dynamic.getLikes() + "人觉得很赞</a></div>\n" +
                                "                        <div class=\"col-12 col-sm-3\"><div class=\"zi zi_msgchat\"></div><a href=\"javascript:void(0);\" onclick=\"comment_show(this," + dynamic.getDynamicId() + ")\" class=\"card-link all-comments\">所有评论</a></div>\n" +
                                "                        <div class=\"col-12 col-sm-2\"></div>\n" +
                                "                        <div class=\"col-12 col-sm-1\"></div>\n" +
                                "                        <div class=\"col-12 col-sm-1\"><a href=\"#\" class=\"alert-link dianzan\" title=\"点赞\"><i class=\"zi zi_digg\"></i></a></div><!--点赞图标-->\n" +
                                "                        <div class=\"col-12 col-sm-1\"><a href=\"\" class=\"alert-link pinglun\"  title=\"评论\"><i class=\"zi zi_fxqp\"></i></a></div><!--评论图标-->\n" +
                                "                        <div class=\"col-12 col-sm-1\"><a href=\"javascript:void (0);\" onclick=\"add_collection(" + dynamic.getDynamicId() + ")\" class=\"alert-link shoucang\" title=\"收藏\"><i class=\"zi zi_box\" zico=\"箱子\"></i></a></div>\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "                <div id=\"all-comment\">评论:</div>" +
                                "                <div class=\"input-group mb-3 comment\">\n" +
                                "                    <input type=\"text\" class=\"form-control\" placeholder=\"评论\" aria-label=\"Recipient's username\" aria-describedby=\"basic-addon2\">\n" +
                                "                    <div class=\"input-group-append\">\n" +
                                "                        <button class=\"btn btn-outline-secondary\" onclick=\"publish_comment(this," + dynamic.getDynamicId() + ");\" type=\"button\">发表</button>\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "            </div>");
            }
        } else {    //如果已经是最后一条朋友圈的，返回提示
            str.append("<script>" +
                    "$(function(){" +
                    "var $modalBody = $('.modal-body p');\n" +
                    "var $tip = $('#tip-modal');" +
                    "$modalBody.html('已经到底了哦，快去发条动态吧...');\n" +
                    "$tip.modal();" +
                    "})" +
                    "</script>");
        }
        //此单纯测试用
        System.out.println("最新的动态ID" + session.getAttribute("max"));
        System.out.println("旧动态ID" + session.getAttribute("min"));
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(str + "");
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String comment() throws IOException {
        System.out.println("进入commment...");
        StringBuffer str = new StringBuffer();
        System.out.println(dynamicId);
        List<Comment> allComment = alumniCircleService.findAllComment(dynamicId);

        if (allComment == null || allComment.size() < 1) {
            str.append("<p>" +
                    "还没有任何评论" +
                    "</p>\n");
        } else {
            str.append("<ul class=\"list-inline\">\n");
            for (Comment comment : allComment) {
                System.out.println(comment.getUserName() + "(" + comment.getDate() + ")" + ":" + comment.getCommentContent());
                str.append(" <li class=\"list-inline\">" +
                        comment.getUserName() + "(" + comment.getDate() + ")" + ":" + comment.getCommentContent() +
                        "</li>\n");
            }
            str.append("</ul>");
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(str + "");
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String publish() throws IOException {
        System.out.println("进入publilsh");
        User user = (User) session.get("user");
        String userId = user.getUserId();//拿到userid
        Calendar cal = Calendar.getInstance();
        int y = cal.get(Calendar.YEAR);
        int m = cal.get(Calendar.MONTH);
        int d = cal.get(Calendar.DATE);
        int h = cal.get(Calendar.HOUR_OF_DAY);
        int mi = cal.get(Calendar.MINUTE);
        int s = cal.get(Calendar.SECOND);
        String now = m + "-" + d + " " + h + ":" + mi;
        int count = alumniCircleService.addComment(userId, dynamicId, commentText, now);
        StringBuffer str = new StringBuffer();
        if (count > 0) {
            str.append("<li>" + user.getUserName() + "(" + now + "):" + commentText + "</li>");
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(str + "");
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String refresh() throws IOException {   //点击刷新，增加从上一次刷新到现在的新增动态号
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int max = (int) session.getAttribute("max");   //找到当前的最新的动态号
        List<Dynamic> moreCircle = alumniCircleService.findRefresh(max);
        StringBuffer str = new StringBuffer();
        if (moreCircle.size() >= 1) {
            System.out.println(moreCircle.get(0).getDynamicId());
            session.setAttribute("max", moreCircle.get(0).getDynamicId());//保存当前最新的动态的ID
            for (Dynamic dynamic : moreCircle) {
                //System.out.println(dynamic.toString());//测试用，删掉
                String[] picsaddress = dynamic.getPicAddress().split(";");
                String pics = "";
                if (dynamic.getPicCount() == 0) {
                    pics = " ";
                } else if (dynamic.getPicCount() == 1) {
                    pics = pics + "<a href=\"http://10.2.16.131/images/" + dynamic.getPicAddress() + "\" target=\"_Blank\">" +
                            "<img src=\"http://10.2.16.131/images/" + dynamic.getPicAddress() + "\" alt=\"\" style=\"width: 300px;\">" +
                            "</a>";
                } else {
                    for (int i = 0; i < picsaddress.length; i++) {  //预先拿到所有图片的HTML代码
                        pics = pics + "<a href=\"http://10.2.16.131/images/" + picsaddress[i] + "\" target=\"_Blank\">" +
                                "<img src=\"http://10.2.16.131/images/" + picsaddress[i] + "\" alt=\"\">" +
                                "</a>";
                    }
                }
                str.append("<div class=\"card\" style=\"\">\n" +
                        "                <div class=\"card-body card-body-main\">\n" +
                        "                    <div class=\"row\">\n" +
                        "                        <div class=\"col-6 col-sm-1\"><a href=\"#\"><img src=\"" + dynamic.getUser().getUserAvatar() + "\" alt=\"头像\" class=\"rounded-circle touxiang\"></a></div>\n" +
                        "                        <div class=\"col-6 col-sm-3 user-info\">\n" +
                        "                            <a class=\"h6 font-weight-bold user-name\" href=\"${pageContext.servletContext.contextPath}/alumniCircle/myCircleMine.action?userId=" + dynamic.getUser().getUserId() + "\">" + dynamic.getUser().getUserName() + "</a><br>\n" +
                        "                            <div class=\"time\">" + dynamic.getDate() + "</div>\n" +
                        "                        </div>\n" +
                        "                    </div>\n" +
                        "                    <p class=\"card-text\">" + dynamic.getContent() + "</p>\n" +
                        "                    <div class=\"user-imgs baguetteBox\">\n");
                str.append(pics);
                str.append(
                        "                    </div>\n" +
                                "                    <div class=\"row\">\n" +
                                "                        <div class=\"col-12 col-sm-3\"><div class=\"zi zi_love\"></div><a href=\"#\" class=\"card-link\">" + dynamic.getLikes() + "人觉得很赞</a></div>\n" +
                                "                        <div class=\"col-12 col-sm-3\"><div class=\"zi zi_msgchat\"></div><a href=\"#\" onclick=\"comment_show(this," + dynamic.getDynamicId() + ")\" class=\"card-link all-comments\">所有评论</a></div>\n" +
                                "                        <div class=\"col-12 col-sm-2\"></div>\n" +
                                "                        <div class=\"col-12 col-sm-1\"></div>\n" +
                                "                        <div class=\"col-12 col-sm-1\"><a href=\"#\" class=\"alert-link dianzan\" title=\"点赞\"><i class=\"zi zi_digg\"></i></a></div><!--点赞图标-->\n" +
                                "                        <div class=\"col-12 col-sm-1\"><a href=\"#\" class=\"alert-link pinglun\" title=\"评论\"><i class=\"zi zi_fxqp\"></i></a></div><!--评论图标-->\n" +
                                "                        <div class=\"col-12 col-sm-1\"><a href=\"javascript:void (0);\" onclick=\"add_collection(" + dynamic.getDynamicId() + ")\" class=\"alert-link shoucang\" title=\"收藏\"><i class=\"zi zi_box\" zico=\"箱子\"></i></a></div>\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "                <div id=\"all-comment\">评论:</div>" +
                                "                <div class=\"input-group mb-3 comment\">\n" +
                                "                    <input type=\"text\" class=\"form-control\" placeholder=\"评论\" aria-label=\"Recipient's username\" aria-describedby=\"basic-addon2\">\n" +
                                "                    <div class=\"input-group-append\">\n" +
                                "                        <button class=\"btn btn-outline-secondary\" onclick=\"publish_comment(this," + dynamic.getDynamicId() + ");\" type=\"button\">发表</button>\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "            </div>");
            }
        } else {    //如果已经没有更新的，返回提示
            str.append("<script>" +
                    "$(function(){" +
                    "var $modalBody = $('.modal-body p');\n" +
                    "var $tip = $('#tip-modal');" +
                    "$modalBody.html('没有最新的消息了，快去发条动态吧...');\n" +
                    "$tip.modal();" +
                    //"$tip.one('hidden.bs.modal', function (e) {\n" +
                    //"              $modalBody.html('没有最新的消息了，快去发条动态吧...');\n" +
                    //"  })" +
                    "})" +
                    "</script>");
        }
        //此单纯测试用
        System.out.println("最新的动态ID" + session.getAttribute("max"));
        System.out.println("旧动态ID" + session.getAttribute("min"));
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(str + "");
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String myCircle() {
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("进入myCircleAction....");
        if (userId == null) {
            return null;
        } else {
            /*String userId = user.getUserId();
            System.out.println(user.getUserPhone());*/
            List<Dynamic> allCircle = alumniCircleService.findMyCircle(userId);
            HttpSession session = request.getSession();
            if (allCircle.size() >= 1) {
                session.setAttribute("MyMin", allCircle.get(allCircle.size() - 1).getDynamicId());//保存当前最旧的动态的ID
            }
            request.setAttribute("allCircleList", allCircle);
            //此单纯测试用
            System.out.println("旧动态ID" + session.getAttribute("MyMin"));
        }
        return SUCCESS;
    }

    public String deleteCircle() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("进入deleteCircle....");
        User user = (User) session.get("user");
        String userid = user.getUserId();//拿到userid
        int dynamicid = Integer.parseInt(request.getParameter("dynamicid"));
        int deletecount = alumniCircleService.deleteMyCircle(dynamicid, userid);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        if (deletecount > 0) {
            out.write("success");
        } else {
            out.write("false");
        }
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String deleteCollection() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("进入deleteCollection");
        User user = (User) session.get("user");
        String userid = user.getUserId();//拿到userid
        int deletecount = alumniCircleService.deleteCollection(dynamicId, userid);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        if (deletecount > 0) {
            out.write("success");
        } else {
            out.write("false");
        }
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String addCircle() throws IOException {
        System.out.println("进入addCircle");
        String userid = "";  //用户id
        String pics = "";     //图片地址
        int picCount = 0;   //图片张数
        User user = (User) session.get("user");
        userid = user.getUserId();//拿到userid
        System.out.println("picCount" + picCount);
        if (picAddress == null) {
            int sendCount = alumniCircleService.addMyCircleNopic(userid, content);
        } else {
            pics = StringUtils.join(picAddress, ",");
            pics = pics.replaceAll("http://10.2.16.131/images/", "");
            picCount = pics.split(",").length;
            int sendCount = alumniCircleService.addMyCircle(userid, pics, picCount, content);
        }
        return "json";
    }

    public String addCollection() throws IOException {
        System.out.println("进入addCollection");
        User user = (User) session.get("user");
        String userId = user.getUserId();//拿到userid
        int count = alumniCircleService.addCollections(userId, dynamicId);
        StringBuffer str = new StringBuffer();
        if (count > 0) {
            str.append("success");
        }
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/json-comment-filtered;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(str + "");
        out.flush();
        out.close();
        return SUCCESS;
    }

    public String findCollectionDynamic() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        System.out.println("进入findCollectionDynamic....");
        if (userId == null) {
            return null;
        } else {
            List<Dynamic> allCircle = alumniCircleService.findCollectionDynamic(userId);
            request.setAttribute("allCircleList", allCircle);
        }
        return SUCCESS;
    }


    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public void setPicAddress(String[] picAddress) {
        this.picAddress = picAddress;
    }

    public String[] getPicAddress() {
        return picAddress;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getDynamicId() {
        return dynamicId;
    }

    public void setDynamicId(int dynamicId) {
        this.dynamicId = dynamicId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

}
