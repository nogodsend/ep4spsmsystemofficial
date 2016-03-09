package com.haph.spsm.master.dao;

import com.haph.spsm.core.dao.IBaseDao;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.master.entity.Role;

public interface IRoleDao extends IBaseDao<Role> {

	public PageList<Role> findRoleWidthPage(Role role, PageBean pageBean);
}
