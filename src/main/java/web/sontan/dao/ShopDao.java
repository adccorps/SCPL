package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Goods;

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
     *  删除商品
     * @param goods 商品
     * @return 返回true 删除成功 false 删除失败
     */
    boolean deleteGoods(@Param("goods") Goods goods);

    /**
     *  修改商品信息
     * @param goods 商品
     * @return 返回goods 成功修改 null修改失败
     */
    Goods modifyGoods(@Param("goods") Goods goods);


}
