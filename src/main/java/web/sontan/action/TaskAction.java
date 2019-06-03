package web.sontan.action;

import cn.hutool.core.util.IdUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import web.sontan.model.Task;
import web.sontan.model.User;
import web.sontan.service.TaskService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 残 on 2019/5/15.
 */
@Controller("taskAction")
@Scope("prototype")
public class TaskAction extends ActionSupport implements SessionAware {

    @Resource
    private TaskService taskService;
    private Task task;
    private List<Task> list;

    public List<Task> getList() {
        return list;
    }

    public void setList(List<Task> list) {
        this.list = list;
    }

    private Map<String, Object> session;
    private String taskId;
    private String taskRecipient;

    public String getTaskRecipient() {
        return taskRecipient;
    }

    public void setTaskRecipient(String taskRecipient) {
        this.taskRecipient = taskRecipient;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    private int code;
    private String tip;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String add() {
        this.task.setTaskId(IdUtil.simpleUUID()); // 设置task_id
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.addTask(this.task);
        if (flag) {
            code = 1;
        } else {
            code = -1;
            tip = "发布失败";
        }
        return "json";
    }

    public String modify() {
        this.task.getTaskId();
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.modifyTask(this.task);
        if (flag) {
            code = 1;
        } else {
            code = -1;
            tip = "修改失败";
        }
        return "json";
    }

    public String accept() {
        this.task.getTaskId();
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.acceptTask(this.task);
        if (flag) {
            code = 1;
        } else {
            code = -1;
            tip = "接受失败";
        }
        return "json";
    }

    public String delete() {
        this.task.getTaskId();
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.deleteTask(this.task);
        if (flag) {
            code = 1;
        } else {
            code = -1;
            tip = "删除失败";
        }
        return "json";
    }

    public String findAll() {
        this.list = taskService.findAll();
        return "success";
    }

    public String findByUserId() {
        User user = (User) session.get("user");
        this.list = taskService.findByUserId(user.getUserId());
        return "success";
    }

    public String findById() {
        this.task = taskService.findById(taskId);
        return "success";
    }

    public String findByRecipient() {
        this.list = taskService.findByRecipient(taskRecipient);
        return "success";
    }


    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}
