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

    /**
     * 添加评论
     * @param reply 评论
     * @return 成功返回true, 失败返回false
     */
    boolean addReply(@Param("reply") Reply reply);

    /**
     * 更新评论
     * @param reply 评论
     * @return 成功返回true, 失败返回false
     */
    boolean updateReply(@Param("reply") Reply reply);

    /**
     * 通过postId查找和post相关的所有评论
     * @param postId 查找的post的唯一标识符
     * @return 和post相关的所有评论
     */
    List<Reply> findByPostId(@Param("postId") String postId);

    Reply findById(@Param("replyId") String replyId);

    List<Reply> findByPostIdLimit(@Param("start") Integer start, @Param("nums") Integer nums, @Param("postId") String postId);

    Integer count(@Param("postId") String postId);
}
