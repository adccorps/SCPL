package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Post;
import web.sontan.model.VO.PostVO;

import java.util.List;

/**
 * 接口{@link PostDao}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Mapper
public interface PostDao {
    /**
     * 根据postId查找post视图对象
     * @param postId post的唯一标识符
     * @return post视图对象
     */
    PostVO findById(@Param("postId") String postId);

    /**
     * 查找所有帖子
     * @param orderType 排序类型(注：使用OrderType接口中的常量)
     * @return 所有帖子
     */
    List<Post> findAll(@Param("orderType") String orderType);

    /**
     * 添加帖子
     * @param post 帖子
     * @return 成功返回true, 失败返回false
     */
    boolean addPost(@Param("post") Post post);

    /**
     * 更新帖子
     * @param post 帖子
     * @return 成功返回true, 失败返回false
     */
    boolean updatePost(@Param("post") Post post);

    List<Post> findByString(@Param("query") String query, @Param("orderType") String orderType);

    List<Post> findByUserId(@Param("userId") String userId, @Param("orderType") String orderType);
}
