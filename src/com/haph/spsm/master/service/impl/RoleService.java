package com.haph.spsm.master.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haph.spsm.core.dao.IBaseDao;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.core.service.impl.BaseService;
import com.haph.spsm.master.dao.IRoleDao;
import com.haph.spsm.master.entity.Role;
import com.haph.spsm.master.service.IRoleService;



@Service
@Transactional 
public class RoleService extends BaseService<Role> implements IRoleService {

	@Resource
	private IRoleDao roleDao;	

	
	@Override
	public PageList<Role> findRoleWidthPage(Role role, PageBean pageBean)
	{
		return roleDao.findRoleWidthPage(role, pageBean);
	}


	@Override
	public IBaseDao<Role> getDao(){
		return roleDao;
	}
	
	

}
