package web.sontan.backup;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Base64;

/**
 * 类{@link Base64Utils}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class Base64Utils {

    /**
     * 把base64转化为文件.
     *
     * @param base64   base64
     * @param filePath 目标文件路径
     * @return boolean isTrue
     */
    public static boolean decryptByBase64(String base64, String filePath) {
        if (base64 == null && filePath == null) {
            return false;
        }
        try {
            Files.write(Paths.get(filePath), Base64.getDecoder().decode(base64),StandardOpenOption.CREATE);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }

    /**
     * 把文件转化为base64.
     *
     * @param filePath 源文件路径
     * @return String 转化后的base64
     */
    public static String encryptToBase64(String filePath) {
        if (filePath == null) {
            return null;
        }
        try {
            byte[] b = Files.readAllBytes(Paths.get(filePath));
            return Base64.getEncoder().encodeToString(b);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static String removeFileId(String base64) {
        return base64.substring(base64.indexOf(",") + 1);
    }
}
