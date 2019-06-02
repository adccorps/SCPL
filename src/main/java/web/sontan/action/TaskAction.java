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

    public String add() {
        this.task.setTaskId(IdUtil.simpleUUID()); // 设置task_id
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.addTask(this.task);
        return "json";
    }

    public String modify() {
        this.task.getTaskId();
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.modifyTask(this.task);
        return "json";
    }
    public String findAll(){
        list = taskService.findAll();
        return "json";
    }

    public String delete() {
        this.task.getTaskId();
        User user = (User) session.get("user");
        this.task.setUser(user);
        boolean flag = taskService.deleteTask(this.task);
        return "json";
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
