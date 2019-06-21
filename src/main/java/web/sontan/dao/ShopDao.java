package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Goods;
import web.sontan.model.Order;

import java.util.List;

/**
 * Created by Wang on 2019/5/17.
 */

@Repository
@Mapper
public interface ShopDao {
    /**
     * 查找所有商品
     * @return 返回所有商品信息
     */
    List<Goods> findAllGoods();

    /**
     *  上传商品
     * @param goods 商品
     * @return 返回true上传成功 false上传失败
     */
    boolean addGoods(@Param("goods") Goods goods);

    /**
     *  用户撤销上传商品
     * @param goods 商品
     * @return 返回true 删除成功 false 删除失败
     */
    boolean deleteGoods(@Param("goods") Goods goods);

    /**
     *  修改商品信息
     * @param goods 商品
     * @return 返回true 成功修改 false修改失败
     */
    boolean modifyGoods(@Param("goods") Goods goods);

    List<Goods> findGoodsByType(@Param("goodsType") String goodsType);

    Goods findGoodsById(@Param("goodsId")String goodsId);

    boolean createOrder(@Param("order") Order order);

    List<Goods> findGoodsByName(@Param("goodsName") String goodsName);

    List<Order> findUserBuyOrder(@Param("userId") String userId);

    List<Goods> findUserSellOrder(@Param("sellerId") String sellerId);
}
