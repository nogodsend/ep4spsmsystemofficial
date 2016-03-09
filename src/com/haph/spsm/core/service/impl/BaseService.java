package com.haph.spsm.core.service.impl;


import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.haph.spsm.core.dao.IBaseDao;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.core.service.IBaseService;

@Service
@Transactional 
public  class BaseService<T> implements IBaseService<T> {

	@Resource
	private IBaseDao<T> baseDao;
	
	
	@Override
	public IBaseDao<T> getDao() {
		// TODO Auto-generated method stub
		return baseDao;
	}
	

	@Override
	public void add(T t) {
		// TODO Auto-generated method stub
		try {
			getDao().add(t);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		try {
			getDao().update(t);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void saveOrUpdate(T t) {
		// TODO Auto-generated method stub
		try {
			getDao().saveOrUpdate(t);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(T t) {
		// TODO Auto-generated method stub
		try {
			getDao().delete(t);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		try {
			getDao().deleteById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteByIds(Serializable ids) {
		// TODO Auto-generated method stub
		try {
			getDao().deleteByIds(ids);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<T> findAll() {
		// TODO Auto-generated method stub
		try {
			return getDao().findAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public PageList<T> findAll(PageBean pageBean) {
		// TODO Auto-generated method stub
		try {
			return getDao().findAll(pageBean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public T getEntity(Serializable id) {
		// TODO Auto-generated method stub
		try {
			return getDao().getEntity(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public T getEntity(T t) {
		// TODO Auto-generated method stub
		try {
			return getDao().getEntity(t);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public PageList<T> findList(T t, PageBean pageBean) {
		// TODO Auto-generated method stub
		try {
			return getDao().findList(t, pageBean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
				
	
	
}
