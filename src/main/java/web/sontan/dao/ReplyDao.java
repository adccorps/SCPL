package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Reply;

import java.util.List;

/**
 * 接口{@link ReplyDao}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Mapper
public interface ReplyDao {

    boolean addReply(@Param("reply") Reply reply);

    boolean updateReply(@Param("reply") Reply reply);

    List<Reply> findByPostId(@Param("postId") String postId);
}
