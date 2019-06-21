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



    public List<Find> findFinds(int pageNum,int view){                            //查找不同类型：0/1/2/3
        PageHelper.startPage(pageNum, 10);
        return findDao.findFinds(view);
    }


//    public List<Find> findSuccessFinds( int status){return findDao.findSuccessFinds(status);}    //查找3类型：成功案例
//    public List<Find> findGoodsByName(String Search){return  findDao.findGoodsByName(Search);}  //模糊查找

    public boolean addFinds(Find find,String userId){return  findDao.addFinds(find,userId);}
    public Find lookFind(int findId){return  findDao.lookFind(findId);}
    public boolean modifyFindToPeriod(int findId){return findDao.modifyFindToPeriod(findId);}
    public boolean modifyPeriodToEnd( int findId){return findDao.modifyPeriodToEnd(findId);}

    public List<Find> ShowUserFind( String userId){return  findDao.ShowUserFind(userId);}//查找用户发布的
    public List<Find> ShowUserOp( String userId){return findDao.ShowUserOp(userId);}//查找用户有关的


}
