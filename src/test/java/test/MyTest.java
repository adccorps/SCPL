package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;
import utils.TextUtils;
/*import web.sontan.dao.AlumniCircleDao;
import web.sontan.model.Dynamic;*/
import web.sontan.model.User;
import web.sontan.service.UserService;

import java.io.*;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.List;

/**
 * 类{@link MyTest}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MyTest {

    @Autowired
    private UserService userService;

    @Autowired
//    private AlumniCircleDao alumniCircleDao;

    @Test
    public void test1() {
        for (User user : userService.queryUsers()) {
            System.out.println(user);
        }
    }

    @Test
    public void test2() {
        NumberFormat numberFormat = NumberFormat.getInstance();

        try {
            String source = "";
            if (source.isEmpty()) {
                System.out.println("empty String");
                return;
            }
            Number parse = numberFormat.parse(source);
            System.out.println(parse);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test() {
        String str = "18320618369";
        User u = new User();
        u.setUserPhone(str);

        User u2 = new User(u);

        String regex = "^(\\d{3})(\\d*)(\\d{4})$";
        String replace = TextUtils.replace(str, regex,
                (s, matcher) -> matcher.group(1) + "●●●●" + matcher.group(3)
        );
        System.out.println(replace);

        String phone = str.replace(str.substring(3, 7), "●●●●");
        u2.setUserPhone(phone);

        System.out.println("u = " + u);
        System.out.println("u2 = " + u2);
    }

    @Test
    public void test3() {
//        File img1 = new File("src/main/webapp/assets/img/test.jpg");
        File img1 = new File("E:/Picture/temp.jpg");
        // bdd2b86a15d36554a346a4480335cc28
        // bdd2b86a15d36554a346a4480335cc28
        File img2 = new File("src/main/webapp/assets/img/temp.webp");

//        InputStream resourceAsStream = MyTest.class.getResourceAsStream("..");
//        String path = MyTest.class.getResource("..").getPath();
//        System.out.println(path.substring(1));
        System.out.println(img1.getAbsolutePath());
        InputStream is1 = null;
        InputStream is2 = null;
        try {
            is1 = new FileInputStream(img1);
            is2 = new FileInputStream(img2);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        try {
            String md5$1 = null;
            String md5$2 = null;
            if (is1 != null) {
                md5$1 = DigestUtils.md5DigestAsHex(is1);
            }
            if (is2 != null) {
                md5$2 = DigestUtils.md5DigestAsHex(is2);
            }
            System.out.println(md5$1);
            System.out.println(md5$2);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

   /* @Test
    public void test112321() {
        List<Dynamic> allCircle = alumniCircleDao.findAllCircle();
        for (Dynamic dynamic : allCircle) {
            System.out.println(dynamic.toString());
        }
    }
*/
}