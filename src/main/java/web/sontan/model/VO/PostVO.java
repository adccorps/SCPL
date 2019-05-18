package web.sontan.model.VO;

import web.sontan.model.Post;
import web.sontan.model.Reply;

import java.util.List;

/**
 * 类{@link PostVO}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class PostVO extends Post {
    private List<Reply> replies;

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }

    @Override
    public String toString() {
        return "PostVO{" +
                "replies=" + replies +
                "} " + super.toString();
    }
}
