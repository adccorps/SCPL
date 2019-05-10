package utils;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 类{@link TextUtils}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class TextUtils {

    public static String replace(String str, Pattern pattern, Function<String, Matcher> fun) {
        Matcher matcher = pattern.matcher(str);
        String all = null;
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            all = matcher.group(0);
            String replace = (String) fun.apply(all, matcher);
            matcher.appendReplacement(sb, replace == null ? "" : replace);
        }
        matcher.appendTail(sb);
        return sb.toString();
    }

    public static String replace(String str, String pattern, Function<String, Matcher> fun) {
        Pattern p = Pattern.compile(pattern);
        return replace(str, p, fun);

    }
}
