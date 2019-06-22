package web.sontan.service;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.FindDao;
import web.sontan.model.Find;



import java.util.List;
/**
 * Created by 臻少 on 2019/6/6.
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class FindService {
    private final FindDao findDao;

    @Autowired
    public FindService(FindDao findDao) {
        this.findDao = findDao;
    }

    public List<Find> findAllFinds(int pageNum){            //查找除了3类型外的全部
        PageHelper.startPage(pageNum, 10);
        return findDao.findAllFinds();
    }

    public List<Find> findBySearch(int pageNum, String query, String orderType) { //模糊查找
        PageHelper.startPage(pageNum, 10);
        return findDao.findBySearch(query, orderType);
    }


    public List<Find> findFinds(int pageNum,int view){                            //查找不同类型：0/1/2/3
        PageHelper.startPage(pageNum, 10);
        return findDao.findFinds(view);
    }


    public boolean addFinds(Find find,String userId){return  findDao.addFinds(find,userId);}
    public List<Find> lookFind(Integer findId){return  findDao.lookFind(findId);}

    public boolean modifyPeriodToEnd( Integer findId,String userId){
        return findDao.modifyPeriodToEnd(findId,userId);}//捡到的-》公示

    public boolean TOend( Integer findId,String userId){
        return findDao.TOend(findId,userId);}//发布的-》完成

    public boolean yijian( Integer findId,String userId){
        return findDao.yijian(findId,userId);}//公示-》意见

    public List<Find> ShowUserOp(int pageNum,String userId){                           //查找用户有关的
        PageHelper.startPage(pageNum, 10);
        return findDao.ShowUserOp(userId);
    }

}
