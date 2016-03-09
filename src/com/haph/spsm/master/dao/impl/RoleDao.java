package com.haph.spsm.master.dao.impl;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.haph.spsm.core.dao.impl.BaseDao;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.core.utils.JudgeHelper;
import com.haph.spsm.master.dao.IRoleDao;
import com.haph.spsm.master.entity.Role;

@Repository("roleDao")
public class RoleDao extends BaseDao<Role> implements IRoleDao {

	
	
	@SuppressWarnings("unchecked")
	public PageList<Role> findRoleWidthPage(Role role, PageBean pageBean){	
		
		
		Criteria cri=getCriteria(role);
		
		if(pageBean!=null){
			
			Criteria totalCriteria = getCriteria(role);
			Long totalCount = (Long) totalCriteria.setProjection(Projections.rowCount()).uniqueResult();
			pageBean.setTotalCount(totalCount);
			
			cri.setFirstResult(pageBean.getLimit()).setMaxResults(pageBean.getOffset());
		}
		
		cri.addOrder(Order.asc("id"));
		List<Role> list =cri.list();
		
		return new PageList<Role>(list, pageBean);
	}
	
	protected Criteria getCriteria(Role role)
	{
		Criteria cri = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Role.class);

		if(role!=null){
			if(!JudgeHelper.isNullOrEmpty(role.getId()))
				cri.add(Restrictions.like("id",role.getId(),MatchMode.ANYWHERE));
			if(!JudgeHelper.isNullOrEmpty(role.getRoleName()))
				cri.add(Restrictions.like("roleName",role.getRoleName(),MatchMode.ANYWHERE));
		}
		
		return cri;
	}

}
