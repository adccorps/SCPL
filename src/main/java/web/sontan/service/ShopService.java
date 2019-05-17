package web.sontan.service;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Wang on 2019/5/17.
 */
@Repository
@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
public class ShopService {
}
