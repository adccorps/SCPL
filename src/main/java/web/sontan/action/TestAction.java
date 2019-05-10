package web.sontan.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.User;
import web.sontan.utils.Base64Utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 类{@link TestAction}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Controller("testAction")
@Scope("prototype")
public class TestAction extends ActionSupport {

    private static final long serialVersionUID = 900585837472937066L;
    private User user;

    public void test() {
        String realPath = ServletActionContext.getServletContext().getRealPath("/assets/img");// 真实地址
        String file1 = realPath + "\\test.jpg";
        String file2 = realPath + "\\test1.jpg";
        String file3 = realPath + "\\test.webp";

        List<String> strs = new ArrayList<>();
        strs.add(file1);
        strs.add(file2);
        strs.add(file3);
        strs.add(file2);
        long start = System.currentTimeMillis();
        List<String> base64s = strs.stream()
                .parallel()
                .map(Base64Utils::encryptToBase64)
                .collect(Collectors.toList());
        long end = System.currentTimeMillis();
        System.out.println(end - start);
        PrintWriter out = null;
        try {
            out = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (out != null) {
            out.println(end - start);
        }

//        System.out.println(base64s);

//        List<Integer> ints = new ArrayList<>();
//        ints.add(1);
//        ints.add(2);
//        ints.add(3);
//        ints.add(4);
//        Optional<Integer> reduce = ints.stream().parallel().reduce((a, b) -> a + b);
//        System.out.println(reduce.get());

        /**/
//        String contextPath = ServletActionContext.getServletContext().getContextPath();// 上下文
//        System.out.println(contextPath);

    }

    public void test2() {
        String realPath = ServletActionContext.getServletContext().getRealPath("/res/img");// 真实地址
        String file1 = realPath + "\\test.jpg";
        String file2 = realPath + "\\test1.jpg";
        String file3 = realPath + "\\test.webp";
//        System.out.println(realPath);
//        System.out.println(file1);
//        System.out.println(file2);
//        System.out.println(file3);

        List<String> strs = new ArrayList<>();
        strs.add(file1);
        strs.add(file2);
        strs.add(file3);
        strs.add(file2);
        long start = System.currentTimeMillis();
        List<String> base64s = strs.stream()
                .map(Base64Utils::encryptToBase64)
                .collect(Collectors.toList());
        long end = System.currentTimeMillis();
        System.out.println("test2");
        System.out.println(end - start);
        PrintWriter out = null;
        try {
            out = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (out != null) {
            out.println(end - start);
        }

//        System.out.println(base64s);

//        List<Integer> ints = new ArrayList<>();
//        ints.add(1);
//        ints.add(2);
//        ints.add(3);
//        ints.add(4);
//        Optional<Integer> reduce = ints.stream().parallel().reduce((a, b) -> a + b);
//        System.out.println(reduce.get());

        /**/
//        String contextPath = ServletActionContext.getServletContext().getContextPath();// 上下文
//        System.out.println(contextPath);
    }

    public void action() {
        System.out.println(user.getUserId());
//        return SUCCESS;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
