package com.haph.spsm.master.service;


import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.core.service.IBaseService;
import com.haph.spsm.master.entity.Role;

public interface IRoleService extends IBaseService<Role>{

	
	public PageList<Role> findRoleWidthPage(Role role, PageBean pageBean);
	
}
