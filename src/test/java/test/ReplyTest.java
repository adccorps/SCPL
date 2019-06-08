package test;

import cn.hutool.core.util.IdUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import web.sontan.model.Post;
import web.sontan.model.Reply;
import web.sontan.model.User;
import web.sontan.service.ReplyService;

/**
 * 类{@link ReplyTest}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ReplyTest {

    @Autowired
    private ReplyService replyService;

    @Test
    public void testAddReply() {
        Reply reply = new Reply();
        reply.setReplyId(IdUtil.simpleUUID()); // action
        Post post = new Post();
        post.setPostId("0802808bed924946bbdcbfbf77a8d806"); // ajax
        reply.setPost(post);
        User user = new User();
        user.setUserId("bd2e9ce03ef74cc1ab0419a83f174ffe"); // action
        reply.setUser(user);
        reply.setReplyContent("<p>眯着它的双眼</p>"); // ajax
        Reply reply1 = new Reply();
        reply1.setReplyId("508c83ea0c3f4ddd882ef09d89cf863d"); // ajax
        reply.setPrevious(reply1);
        replyService.addReply(reply);
    }

}
