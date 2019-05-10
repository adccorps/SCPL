package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.User;

import java.util.List;

/**
 * 类{@link UserDao}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Mapper
public interface UserDao {

    /**
     * 查找所有用户
     * @return 返回所有用户的list集合
     */
    List<User> findAll();

    /**
     * 保存用户信息 (注册)
     * @param user 用户
     * @return 保存成功返回true，否则返回false
     */
    boolean saveUser(@Param("user") User user);

    /**
     * 根据用户Id查找用户
     * @param userId 用户Id
     * @return 如果匹配成功返回该用户，否则返回null
     */
    User findById(@Param("userId") String userId);

    /**
     * 根据用户手机号和密码查找用户 (登录)
     * @param userPhone 用户手机号
     * @param userPass 用户密码
     * @return 如果匹配成功返回该用户，否则返回null
     */
    User findByPhoneAndPass(@Param("userPhone") String userPhone, @Param("userPass") String userPass);

    /**
     * 可选择的更新用户信息 (为null的信息不更新)
     * @param user 用户
     * @return 更新成功返回true，否则返回false
     */
    boolean updateUserSelective(@Param("user") User user);

    /**
     * 可选择的保存用户信息 (为null的信息不更新)
     * @param user 用户
     * @return 保存成功返回true，否则返回false
     */
    boolean saveUserSelective(@Param("user") User user);

    User findByPhone(@Param("userPhone") String userPhone);

}