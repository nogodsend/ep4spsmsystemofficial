package com.haph.spsm.master.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haph.spsm.core.dao.IBaseDao;
import com.haph.spsm.core.service.impl.BaseService;
import com.haph.spsm.master.dao.IUserDao;
import com.haph.spsm.master.entity.User;
import com.haph.spsm.master.service.IUserService;

@Service
@Transactional 
public class UserService extends BaseService<User> implements IUserService {

	@Resource
	private IUserDao userDao;
	
	@Override
	public IBaseDao<User> getDao() {
		// TODO Auto-generated method stub
		return userDao;
	}
	
}
