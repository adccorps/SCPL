package web.sontan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.sontan.dao.UserDao;
import web.sontan.model.User;

import java.util.List;

/**
 * 类{@link UserService}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class UserService {

    private final UserDao userDao;

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public List<User> queryUsers() {
        return userDao.findAll();
    }

    public boolean register(User user) {
        return userDao.saveUserSelective(user);
    }

    public User findById(String userId) {
        return userDao.findById(userId);
    }

    public User login(User user) {
        return userDao.findByPhoneAndPass(user.getUserPhone(), user.getUserPass());
    }

    public boolean update(User user) {
        return userDao.updateUserSelective(user);
    }

    public User findByPhone(String userPhone) {
        return userDao.findByPhone(userPhone);
    }
}
