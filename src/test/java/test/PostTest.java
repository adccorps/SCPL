package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import web.sontan.model.Post;
import web.sontan.model.VO.PostVO;
import web.sontan.service.PostService;

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
        List<Post> all = postService.findAll("DESC");
        for (Post post : all) {
            System.out.println(post);
//            System.out.println(Arrays.toString(post.getCreateTime().split("\\.0")));
        }
    }

    @Test
    public void findById() {
        PostVO postVO = postService.findById("45f8b9d1876f4db383a61b70bcb3d5b0");
        System.out.println(postVO);
        System.out.println(postVO.getReplies().isEmpty());
        System.out.println(postVO.getReplies() == null);
    }

}
