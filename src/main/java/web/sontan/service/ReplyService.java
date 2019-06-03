package web.sontan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.ReplyDao;
import web.sontan.model.Reply;

import java.util.List;

/**
 * 类{@link ReplyService}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class ReplyService {

    private final ReplyDao replyDao;

    @Autowired
    public ReplyService(ReplyDao replyDao) {
        this.replyDao = replyDao;
    }

    public boolean addReply(Reply reply) {
        return replyDao.addReply(reply);
    }

    public boolean modifyReply(Reply reply) {
        reply.setReplyStatus(1);
        return replyDao.updateReply(reply);
    }

    public boolean deleteReply(Reply reply) {
        reply.setReplyStatus(2);
        return replyDao.updateReply(reply);
    }

    public Reply findById(String replyId) {
        return replyDao.findById(replyId);
    }

    public List<Reply> findLimit(int pageNum, String postId) {
        int start = test(pageNum);
        int nums = 10;
        if (pageNum == 1) {
            nums = 9;
        }

        return replyDao.findByPostIdLimit(start, nums, postId);
    }

    private int test(int n) {
        if (n <= 0) {
            n = 1;
        }
        int a1 = 9;
        int an = a1 + (n - 2) * 10;
        if (n == 1) {
            an = 0;
        }
        return an;
    }

    public int count(String postId) {
        Integer count = replyDao.count(postId);
        if (count != null) {
            return count;
        }
        return 0;
    }

    /*
     * 第二种分页:
     * sql语句
     * 1. 先获取总数，返回计算出来的页数pageNum = Math.ceil((count - 9) / 10.0)
     * 2. findLimit(offset, limit)
     * */
}
