package web.sontan.model;

/**
 * Created by 残 on 2019/5/15.
 */
public class Task {
    private String taskId;
    private String taskType;
    private String taskCompany;
    private String taskQuantity;
    private String taskSize;
    private Integer taskMoney;
    private String taskMessage;
    private Integer taskStatus;
    private String taskRecipient;

    public String getTaskRecipient() {
        return taskRecipient;
    }

    public void setTaskRecipient(String taskRecipient) {
        this.taskRecipient = taskRecipient;
    }

    public Integer getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Integer taskStatus) {
        this.taskStatus = taskStatus;
    }

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public String getTaskCompany() {
        return taskCompany;
    }

    public void setTaskCompany(String taskCompany) {
        this.taskCompany = taskCompany;
    }

    public String getTaskQuantity() {
        return taskQuantity;
    }

    public void setTaskQuantity(String taskQuantity) {
        this.taskQuantity = taskQuantity;
    }

    public String getTaskSize() {
        return taskSize;
    }

    public void setTaskSize(String taskSize) {
        this.taskSize = taskSize;
    }

    public Integer getTaskMoney() {
        return taskMoney;
    }

    public void setTaskMoney(Integer taskMoney) {
        this.taskMoney = taskMoney;
    }

    public String getTaskMessage() {
        return taskMessage;
    }

    public void setTaskMessage(String taskMessage) {
        this.taskMessage = taskMessage;
    }

    @Override
    public String toString() {
        return "Task{" +
                "taskId='" + taskId + '\'' +
                ", taskType='" + taskType + '\'' +
                ", taskCompany='" + taskCompany + '\'' +
                ", taskQuantity='" + taskQuantity + '\'' +
                ", taskSize='" + taskSize + '\'' +
                ", taskMoney='" + taskMoney + '\'' +
                ", taskMessage='" + taskMessage + '\'' +
                ", taskStatus=" + taskStatus +
                ", taskRecipient='" + taskRecipient + '\'' +
                ", user=" + user +
                '}';
    }
}
