package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import web.sontan.model.Post;
import web.sontan.service.PostService;

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
        List<Post> all = postService.findAll();
        for (Post post : all) {
            System.out.println(post);
        }
    }

}
