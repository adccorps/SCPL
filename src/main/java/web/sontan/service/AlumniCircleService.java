package web.sontan.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.AlumniCircleDao;
import web.sontan.model.Comment;
import web.sontan.model.Dynamic;

import java.util.List;

/**
 * 类{@link UserService}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class AlumniCircleService {

    private final AlumniCircleDao alumniCircleDao;

    @Autowired
    public AlumniCircleService(AlumniCircleDao alumniCircleDao) {
        this.alumniCircleDao = alumniCircleDao;
    }

    public List<Dynamic> findAllCircle() {
        return alumniCircleDao.findAllCircle();
    }
    public List<Dynamic> findLoadMore(int min){return alumniCircleDao.findLoadMore(min);}
    public List<Dynamic> findRefresh(int max){return alumniCircleDao.findRefresh(max);}
    public List<Dynamic> findMyCircle(String userId){return alumniCircleDao.findMyCircle(userId);}
    public List<Comment> findAllComment(int dynamicId){return alumniCircleDao.findAllComment(dynamicId);}
    public List<Dynamic> findCollectionDynamic(String userId){return alumniCircleDao.findCollectionDynamic(userId);}
    public int deleteMyCircle(int dynamicId,String userId){return alumniCircleDao.deleteMyCircle(dynamicId,userId);}
    public int deleteCollection(int dynamicId,String userId){return alumniCircleDao.deleteCollection(dynamicId,userId);}
    public int addMyCircle(String userId,String pics,int picCount,String content){return alumniCircleDao.addMyCircle(userId,pics,picCount,content);}
    public int addMyCircleNopic(String userId,String content){return alumniCircleDao.addMyCircleNopic(userId,content);}
    public int addComment(String userId,int dynamicId,String commentText,String nowdate){return alumniCircleDao.addComment(userId,dynamicId,commentText,nowdate);}
    public int addCollections(String userId,int dynamicId){return alumniCircleDao.addCollections(userId,dynamicId);}
}
