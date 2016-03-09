package com.haph.spsm.core.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.haph.spsm.core.pojo.OrderWay;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.master.entity.Role;

public class BaseController {
	
	public String[] columns;

	/*@ExceptionHandler  
    public String exp(HttpServletRequest request, Exception ex) {  
          
        request.setAttribute("ex", ex);  
          
        // 根据不同错误转向不同页面  
        return "error";  
    }*/
	
	
	/**
	 * 初始化分页参数
	 * @param request
	 * @return
	 */
	public PageBean initPage(HttpServletRequest request){
			
		int startIndex=Integer.parseInt(request.getParameter("start"));
		int pageSize=Integer.parseInt(request.getParameter("length"));		
		int curPageIndex=startIndex/pageSize+1;
		
		//查询条件
		String searchValue = request.getParameter("search[value]");
		
		//定义列名
	    String[] cols = columns;
	    //获取客户端需要那一列排序
	    String orderColumn = "0";
	    orderColumn = request.getParameter("order[0][column]");
	    orderColumn = cols[Integer.parseInt(orderColumn)];
	    //获取排序方式 默认为asc
	    OrderWay orderWay=OrderWay.Asc;
	    String orderDir = request.getParameter("order[0][dir]");
	    if(orderDir=="desc")
	    	orderWay=OrderWay.Desc;
		
		
		PageBean pageBean=new PageBean();
		
		pageBean.setPage(curPageIndex);
		pageBean.setPageSize(pageSize);
		pageBean.setSearchValue(searchValue);
		pageBean.setOrderColumn(orderColumn);
		pageBean.setOrderWay(orderWay);
		
		return pageBean;
		
	}

	/**
	 * 分页数据转为Json
	 * @param request
	 * @param result
	 * @return
	 */
	public String toJsonWithDate(HttpServletRequest request,PageList<Role> result){
		
		String draw = request.getParameter("draw");
		
		Map<Object, Object> info = new HashMap<Object, Object>();
		info.put("data", result.getResultList());
		info.put("recordsTotal", result.getPageBean().getTotalCount());
		info.put("recordsFiltered", result.getPageBean().getTotalCount());
		info.put("draw", draw);	
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		

		return gson.toJson(info);		
	}
}
