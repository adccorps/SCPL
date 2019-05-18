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
    PostVO findById(@Param("postId") String postId);

    List<Post> findAll(@Param("orderType") String orderType);

    boolean addPost(@Param("post") Post post);

    boolean updatePost(@Param("post") Post post);
}
