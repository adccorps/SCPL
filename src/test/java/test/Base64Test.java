package test;

import org.junit.Test;
import utils.Base64Utils;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * 类{@link Base64Test}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class Base64Test {
    @Test
    public void test() {
        File file = new File("");

        System.out.println(Base64Test.class.getResource("..").getPath());

        String base64 = null;
        try {
            base64 = Base64Utils.encryptToBase64(file.getCanonicalPath() + "\\test.jpg");
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(base64);
    }

    @Test
    public void test2() {
        List<String> list1 = new ArrayList<>();
        List<String> list2 = new ArrayList<>();

        list1.add("6666");
        list1.add("7777");

        list2.add("8888");
        list2.add("9999");

        long start = System.currentTimeMillis();
        HashMap<String, String> map = IntStream
                .range(0, list1.size())
                .collect(HashMap<String, String>::new, (m, i) -> m.put(list1.get(i), list2.get(i)), (m1, m2) -> {
                });
        long end = System.currentTimeMillis();
        System.out.println(map);
        System.out.println(end - start);

        long start1 = System.currentTimeMillis();
        Map<String, String> collect = list1
                .stream()
                .collect(Collectors.toMap(key -> key,
                        key -> list2.get(list1.indexOf(key)
                        )));
        long end1 = System.currentTimeMillis();
        System.out.println(collect);
        System.out.println(end1 - start1);


    }

    @Test
    public void test3() {
        List<String> list1 = new ArrayList<>();
        List<String> list2 = new ArrayList<>();

        list1.add("123");
        list1.add("789");

        list2.add("456");
        list2.add("100");

        long start = System.currentTimeMillis();
        Map<String, String> collect = list1.stream().collect(Collectors.toMap(key -> key, key -> list2.get(list1.indexOf(key))));
        long end = System.currentTimeMillis();
        System.out.println(end - start);

        System.out.println(collect);
    }

    @Test
    public void test4() {
        Long l = Long.parseLong("");
        System.out.println(l);
    }
}
