package web.sontan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import web.sontan.model.Task;

import java.util.List;


/**
 * Created by 残 on 2019/5/15.
 */
@Repository
@Mapper
public interface TaskDao {
    Task findById(@Param("taskId") String taskId);

    List<Task> findAll();

    List<Task> findByUserId(@Param("userId") String userId);

    List<Task> findByRecipient(@Param("taskRecipient") String taskRecipient);

    boolean addTask(@Param("task") Task task);

    boolean updateTask(@Param("task") Task task);

    boolean acceptTask(@Param("task") Task task);

}
