package com.haph.spsm.master.dao.impl;



import org.springframework.stereotype.Repository;

import com.haph.spsm.core.dao.impl.BaseDao;
import com.haph.spsm.master.dao.IUserDao;
import com.haph.spsm.master.entity.User;
@Repository("userDao")
public class UserDao extends BaseDao<User> implements IUserDao {
	
}
