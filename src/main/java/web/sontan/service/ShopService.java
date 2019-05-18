package web.sontan.service;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.ShopDao;
import web.sontan.model.Goods;

import java.util.List;

/**
 * Created by Wang on 2019/5/17.
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class ShopService {
    private final ShopDao shopDao;


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
    public Goods modifyGoods(Goods goods){
        return shopDao.modifyGoods(goods);
    }
}
