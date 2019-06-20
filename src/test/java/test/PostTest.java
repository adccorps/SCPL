package test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import web.sontan.model.Post;
import web.sontan.model.Reply;
import web.sontan.model.VO.PostVO;
import web.sontan.service.PostService;
import web.sontan.utils.sql.OrderType;

import java.util.Arrays;
import java.util.List;

/**
 * 类{@link PostTest}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class PostTest {

    @Autowired
    private PostService postService;

    @Test
    public void findAllTest() {
        int page = 2; // 页面传入
        int start = test(page);
        int nums = 10;
        if (page == 1) {
            nums = 9;
        }
        PageHelper.offsetPage(start, nums);
        List<Post> all = postService.findAll(page, "DESC");
        /*PageInfo<Post> of = PageInfo.of(all);
        long total = postPageInfo.getPages();
        System.out.println("total = " + total);
        System.out.println("all.size() = " + all.size());*/
        for (Post post : all) {
            System.out.println(post);
        }
    }

    public int test(int n) {
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

    @Test
    public void findById() {
        PostVO postVO = postService.findById("678fca190781413b98eb724386e51e55");
        for (Reply reply : postVO.getReplies()) {
            if (reply.getPrevious() != null) {
                System.out.println(reply.getPrevious());
            }
        }
    }

    @Test
    public void test4() {
        List<Post> byUserId = postService.findByUserId(1, "92aa2e75ba6f413888bebf0392baab17", OrderType.DESC);
        for (Post post : byUserId) {
            System.out.println(post);
        }
    }

}
