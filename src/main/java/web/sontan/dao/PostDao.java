package web.sontan.dao;

import org.apache.ibatis.annotations.Param;
import web.sontan.model.Post;

import java.util.List;

/**
 * 接口{@link PostDao}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public interface PostDao {
    Post findById(@Param("postId") String postId);

    List<Post> findAll();

    boolean addPost(@Param("post") Post post);

    boolean updatePost(@Param("post") Post post);
}
