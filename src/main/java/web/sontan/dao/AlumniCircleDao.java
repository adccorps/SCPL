package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Comment;
import web.sontan.model.Dynamic;

import java.util.List;


@Repository
@Mapper
public interface AlumniCircleDao {
    /**
     * 查找最新前10条朋友圈
     *
     * @return 返回所有朋友圈信息
     */
    List<Dynamic> findAllCircle();

    /**
     * 查找更多朋友圈
     *
     * @return 返回所有朋友圈信息
     */
    List<Dynamic> findLoadMore(@Param("min") int min);

    /**
     * 查找最新的所有朋友圈
     *
     * @return 返回所有朋友圈信息
     */
    List<Dynamic> findRefresh(@Param("max") int max);

    List<Dynamic> findMyCircle(@Param("userId") String userId);

    List<Comment> findAllComment(@Param("dynamicId") int dynamicId);

    List<Dynamic> findCollectionDynamic(@Param("userId") String userId);

    int deleteMyCircle(@Param("dynamicId") int dynamicId, @Param("userId") String userId);



    int addMyCircle(@Param("userId") String userId, @Param("pics") String pics, @Param("picCount") int picCount, @Param("content") String content);

    int addMyCircleNopic(@Param("userId") String userId, @Param("content") String content);

    int addComment(@Param("userId") String userId, @Param("dynamicId") int dynamicId, @Param("commentText") String commentText, @Param("nowdate") String nowdate);


    List<Integer> allCollection(@Param("userId") String userId);
    String isCollections(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
    int changeCollection(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
    int deleteCollection( @Param("userId") String userId , @Param("dynamicId") int dynamicId);
    int addCollections(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
    List<String> likes(@Param("dynamicId") int dynamicId);

    List<Integer> allLikes(@Param("userId") String userId);
    String isLikes(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
    int addLikes(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
    //修改为未赞状态
    int deleteLikes(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
    //修改为点赞状态
    int add(@Param("userId") String userId, @Param("dynamicId") int dynamicId);
}

