package com.haph.spsm.core.dao;

import java.util.List;


import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;

public interface IBaseDao<T> {
	public void add(T t) throws Exception;
	public void update(T t) throws Exception;
	public void saveOrUpdate(T t) throws Exception;
	public void delete(T t) throws Exception;
	public void deleteById(java.io.Serializable id) throws Exception;
	public void deleteByIds(java.io.Serializable ids) throws Exception;
	public List<T> findAll() throws Exception;
	public PageList<T> findAll(PageBean pageBean) throws Exception;
	public T getEntity(java.io.Serializable id) throws Exception;
	public T getEntity(final T entity) throws Exception;
	public PageList<T> findList(final T entity, final PageBean pageBean) throws Exception;
}