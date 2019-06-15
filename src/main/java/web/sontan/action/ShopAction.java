package web.sontan.action;

import cn.hutool.core.util.IdUtil;
import com.bastengao.struts2.freeroute.Results;
import com.bastengao.struts2.freeroute.annotation.MethodType;
import com.bastengao.struts2.freeroute.annotation.Route;
import com.github.pagehelper.PageInfo;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Goods;
import web.sontan.model.Order;
import web.sontan.model.Post;
import web.sontan.model.User;
import web.sontan.service.ShopService;
import web.sontan.service.UserService;
import web.sontan.utils.sql.OrderType;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;
import java.util.List;

/**
 * Created by Wang on 2019/5/17.
 */
@Controller("shopAction")
@Scope("prototype")
public class ShopAction extends ActionSupport implements SessionAware {
    @Resource
    private ShopService ShopService;
    @Resource
    private UserService userService;
    private Map<String, Object> session;
    private Order order;
    private String tip;
    private Integer shopError = 0;
    private Goods goods;
    private String[] files;

    private int pageNum;
    private int totalPages;

    /*
    * 跳转页面action
    * */
    public String viewIndex() {

        return SUCCESS;
    }
    public String viewAdd() {
        return SUCCESS;
    }
    public String viewModify() {
        goods = ShopService.findGoodsById(goods.getGoodsId());
        return SUCCESS;
    }


    /**
     * 上传商品信息
     */
    public String addGoods() {
      //  System.out.println(goods.getGoodsName());
        StringBuffer curPic=new StringBuffer();
        for (int i = 0; i < files.length; i++) {
            System.out.println(files[i]);
           curPic = curPic.append(files[i]);
            curPic.append(",");
        }
        //System.out.println(curPic.toString());
        this.goods.setGoodsId(IdUtil.simpleUUID());// 设置post_id
        User user = (User) session.get("user");
        this.goods.setSeller(user);
        this.goods.setGoodsPic(curPic.toString());
        this.goods.setGoodsStatus(0);
       boolean flag= ShopService.addGoods(goods);
       if (flag==true){
           tip = "上传成功";
       }
        return "json";
    }

    /*
    * 查找所有的商品 (未完全)
    * */
    public String queryGoods() {

        goodsList = ShopService.queryGoods(pageNum); // TODO 分页
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
        this.totalPages = goodsPageInfo.getPages();
        if (goodsList.size() ==0){
            shopError=-1;//无商品出售
        }
        return "json";
    }

    /**
   * 跳转到单个商品详情页面处理
   * */


    public String getGoodsInfo() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String curGoddsId = request.getParameter("goods.goodsId");
        if (curGoddsId != null) {//防止无传值id
//            System.out.println("ceshi---"+goods.getGoods()+"-----");
            goods = ShopService.findGoodsById(goods.getGoodsId());
        }
        return SUCCESS;
    }

    public String buyGoods() {

        goods = ShopService.findGoodsById(goods.getGoodsId());//得到当前商品
        //判断商品是否已经出售
       if(goods.getGoodsStatus() ==0) {
        User buyer = new User();
        User seller = new User();
        buyer = (User) session.get("user");
        if (goods.getSeller().getUserId().equals(buyer.getUserId())) {//防止自己购买自己的商品
            tip = "无法购买自己的商品";
            shopError = -2;
        } else {
            if (order == null) {
                Order order = new Order();
                order.setOrderId(IdUtil.simpleUUID());//设置Id
                order.setGoods(goods);//放入商品Id
                order.setBuyer(buyer);
                seller = userService.findById(goods.getSeller().getUserId());
//                System.out.println(seller.getUserId().equals(goods.getSellerId()));
                order.setSeller(seller);


                boolean buyFlag = ShopService.createOrder(order);
                if (buyFlag == false) {
                    tip = "无法创建订单,购买失败";
                    shopError = -3;
                } else {
                    goods.setGoodsStatus(1);//标志购买
                    ShopService.modifyGoods(goods);
                    tip = "购买成功";
                    shopError = 1;
                }
            }
        }
    }else {
           tip = "商品已出售,购买失败";
           shopError = -5;
       }
        return "json";
    }

    public String findGoodsByType() {
        // System.out.println(goods.getGoodsType());
        goodsList = ShopService.findGoodsByType(goods.getGoodsType(),pageNum);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
        this.totalPages = goodsPageInfo.getPages();
//        System.out.println(goodsList.size());
        if (goodsList.size() == 0) {
            shopError = -4;
        }
        return "json";
    }

    public String findGoodsByName() {
        goodsList = ShopService.findGoodsByName(goods.getGoodsName(),pageNum);
        PageInfo<Goods> goodsPageInfo = new PageInfo<>(goodsList);
        this.totalPages = goodsPageInfo.getPages();
//        System.out.println(goodsList.size());
        if (goodsList.size() == 0) {
            shopError = -4;
        }
        return "json";
    }

    public String checkOrder() {
        User user = (User) session.get("user");
        goodsList = ShopService.findUserSellOrder(user.getUserId());
        return SUCCESS;
    }

    public String checkBuy() {
        User user = (User) session.get("user");
        orderList = ShopService.findUserBuyOrder(user.getUserId());
        return SUCCESS;
    }

    public String orderCompletion(){
       goods= ShopService.findGoodsById(goods.getGoodsId());
       goods.setGoodsStatus(2);
       boolean flag = ShopService.modifyGoods(goods);
       if (flag==true){
           return SUCCESS;
       } else {
           return ERROR;
       }

    }

    public String orderCancel(){
        goods= ShopService.findGoodsById(goods.getGoodsId());
        goods.setGoodsStatus(0);
        boolean flag = ShopService.modifyGoods(goods);
        if (flag==true){
            return SUCCESS;
        } else {
            return ERROR;
        }

    }

    public String updateGoods(){
        System.out.println(goods.getGoodsName());
        String new_name=goods.getGoodsName();
        String new_desc=goods.getGoodsDesc();
        BigDecimal new_price=goods.getGoodsPrice();

            StringBuffer curPic = new StringBuffer();
            for (int i = 0; i < files.length; i++) {
                System.out.println(files[i]);
                curPic = curPic.append(files[i]);
                curPic.append(",");
            }
            System.out.println(curPic.toString());



        goods= ShopService.findGoodsById(goods.getGoodsId());
        //设置修改后的值
        goods.setGoodsName(new_name);
        goods.setGoodsDesc(new_desc);
        goods.setGoodsPrice(new_price);
        goods.setGoodsPic(curPic.toString());

       boolean flag= ShopService.modifyGoods(goods);
        if (flag==true){
            tip = "修改成功";
        }
        return "json";
    }

    /**
     *  变量的get/set方法
     * */
    public int getPageNum() {
        return pageNum;
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
    public int getTotalPages() {
        return totalPages;
    }
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
    public String[] getFiles() {
        return files;
    }
    public void setFiles(String[] files) {
        this.files = files;
    }
    public Goods getGoods() {
        return goods;
    }
    public void setGoods(Goods goods) {
        this.goods = goods;
    }
    public Integer getShopError() {
        return shopError;
    }
    public void setShopError(Integer shopError) {
        this.shopError = shopError;
    }
    public String getTip() {
        return tip;
    }
    public void setTip(String tip) {
        this.tip = tip;
    }
    public Order getOrder() {
        return order;
    }
    public void setOrder(Order order) {
        this.order = order;
    }
    private List<Order> orderList;
    public List<Order> getOrderList() {
        return orderList;
    }
    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }
    private List<Goods> goodsList;
    public List<Goods> getGoodsList() {
        return goodsList;
    }
    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}
