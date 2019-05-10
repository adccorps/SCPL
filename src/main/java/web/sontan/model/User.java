package web.sontan.model;

/**
 * 类{@link User}
 *
 * @author SnoopyAquarius
 * @since 1.0
 */
public class User {

    private String userId;
    private String userName;
    private String userPass;
    private String userAvatar;
    private String userAddress;
    private String userPhone;

    public User() {
    }

    public User(User user) {
        this.userId = user.getUserId();
        this.userName = user.getUserName();
        this.userAddress = user.getUserAddress();
        this.userAvatar = user.getUserAvatar();
        this.userPass = user.getUserPass();
        this.userPhone = user.getUserPhone();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPass='" + userPass + '\'' +
                ", userAvatar='" + userAvatar + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", userPhone='" + userPhone + '\'' +
                '}';
    }
}
