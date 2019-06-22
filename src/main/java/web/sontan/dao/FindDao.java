package web.sontan.dao;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Find;
import web.sontan.model.Order;
import web.sontan.model.Post;

import java.util.List;

/**
 * Created by 臻少 on 2019/5/17.
 */

@Repository
@Mapper
public interface FindDao {
    //------------------物品模块--------------------//
    /**
     * 查找所有物品（index首页，三种类型齐上阵）
     * @return 返回所有物品信息
     */
    List<Find> findAllFinds();
    List<Find> findFinds(@Param("view") int view);    //查找0类型：失物
//    List<Find> findFindFinds(@Param("status") int status);    //查找1类型：招领
//    List<Find> findPeriodFinds(@Param("status") int status);    //查找2类型：公示
//    List<Find> findSuccessFinds(@Param("status") int status);    //查找3类型：成功案例
//    List<Find> findGoodsByName(@Param("Search") String Search);  //模糊查找
    /**
     *  上传类型
     * @param find 物品
     * @return 返回true上传成功 false上传失败
     */
    boolean addFinds(@Param("find") Find find,@Param("userId") String userId);
    List<Find> findBySearch(@Param("query") String query, @Param("orderType") String orderType);

    List<Find> lookFind(@Param("findId") int findId);
    /**
     *  修改物品品类型（status：0，1，2，3之间的转换）
     */
    //boolean modifyFindToPeriod(@Param("findId") int findId);
    boolean TOend(@Param("findId") int findId,@Param("userId") String userId);
    boolean modifyPeriodToEnd(@Param("findId") int findId,@Param("userId") String userId);
    boolean yijian(@Param("findId") int findId,@Param("userId") String userId);
    //------------------end--------------------//



    //------------------用户模块--------------------//
    List<Find> ShowUserOp(@Param("userId") String userId);//查找用户有关的

    //------------------end--------------------//
}
