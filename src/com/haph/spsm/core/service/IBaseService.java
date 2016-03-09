package com.haph.spsm.core.service;

import java.util.List;

import com.haph.spsm.core.dao.IBaseDao;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;


public interface IBaseService<T> {

	public IBaseDao<T> getDao();
	
	public void add(T t);
	public void update(T t);
	public void saveOrUpdate(T t) ;
	public void delete(T t) ;
	public void deleteById(java.io.Serializable id) ;
	public void deleteByIds(java.io.Serializable ids) ;
	public List<T> findAll() ;
	public PageList<T> findAll(PageBean pageBean) ;
	public T getEntity(java.io.Serializable id) ;
	public T getEntity(final T t) ;
	public PageList<T> findList(final T t, final PageBean pageBean) ;
	
}
