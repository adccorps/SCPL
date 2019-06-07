package web.sontan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.ShopDao;
import web.sontan.model.Goods;
import web.sontan.model.Order;

import java.util.List;

/**
 * Created by Wang on 2019/5/17.
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class ShopService {
    private final ShopDao shopDao;

    @Autowired
    public ShopService(ShopDao shopDao) {
        this.shopDao = shopDao;
    }

    public boolean addGoods(Goods goods){
        return shopDao.addGoods(goods);
    }

    public List<Goods> queryGoods(){
        return shopDao.findAllGoods();
    }
    public boolean deleteGoods(Goods goods){
        return shopDao.deleteGoods(goods);
    }
    public boolean modifyGoods(Goods goods){
        return shopDao.modifyGoods(goods);
    }

    public List<Goods> findGoodsByType(String goodsType){
        return shopDao.findGoodsByType(goodsType);
    }
    public Goods findGoodsById(String goodsId){
        return shopDao.findGoodsById(goodsId);
    }

    public boolean createOrder(Order order){
        return  shopDao.createOrder(order);
    }

    public List<Goods> findGoodsByName(String goodsName){
        return shopDao.findGoodsByName(goodsName);
    }

    public List<Order> findUserBuyOrder(String userId){
        return shopDao.findUserBuyOrder(userId);
    }

    public List<Goods> findUserSellOrder(String sellerId){
        return shopDao.findUserSellOrder(sellerId);
    }
}
