package web.sontan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.PostDao;
import web.sontan.model.Post;

import java.util.List;

/**
 * 类{@link PostService}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class PostService {
    private final PostDao postDao;

    @Autowired
    public PostService(PostDao postDao) {
        this.postDao = postDao;
    }

    public Post findById(String postId) {
        return postDao.findById(postId);
    }

    public List<Post> findAll() {
        return postDao.findAll();
    }

    public boolean addPost(Post post) {
        return postDao.addPost(post);
    }

    public boolean modifyPost(Post post) {
        post.setPostStatus(1);
        return postDao.updatePost(post);
    }

    public boolean deletePost(Post post) {
        post.setPostStatus(2);
        return postDao.updatePost(post);
    }

}
