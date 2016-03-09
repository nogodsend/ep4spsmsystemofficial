package com.haph.spsm.master.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.haph.spsm.core.controller.BaseController;
import com.haph.spsm.core.pojo.PageBean;
import com.haph.spsm.core.pojo.PageList;
import com.haph.spsm.master.entity.Role;
import com.haph.spsm.master.service.IRoleService;

@Controller
@RequestMapping("/Role")
public class RoleController extends BaseController {

	@Resource
	private IRoleService roleService;

	@RequestMapping("/Index")
	public ModelAndView Index() {
		return new ModelAndView("Views/system/Role");
	}

	@ResponseBody
	@RequestMapping("/List")
	public String getAllRole(HttpServletRequest request) {

		this.columns = new String[] { "id", "roleName", "createTime" };

		PageBean pageBean = initPage(request);

		Role role = new Role();
		role.setId(pageBean.getSearchValue());
		role.setRoleName(pageBean.getSearchValue());

		PageList<Role> result = roleService.findRoleWidthPage(role, pageBean);

		return toJsonWithDate(request, result);

	}

	@ResponseBody
	@RequestMapping("/Add")
	public boolean AddRole(HttpServletRequest request) {

		String str = request.getParameter("role");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Role role = gson.fromJson(str, Role.class);
		role.setId(null);

		roleService.add(role);
		return true;
	}

	@ResponseBody
	@RequestMapping("/Update")
	public boolean UpdateRole(HttpServletRequest request) {

		String str = request.getParameter("role");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		Role role = gson.fromJson(str, Role.class);

		roleService.update(role);
		return true;
	}

	@ResponseBody
	@RequestMapping("/Delete")
	public boolean DeleteRole(HttpServletRequest request) {

		// 获取请求次数
		String ids = request.getParameter("id");
		if (ids.indexOf(",") > 0) {
			roleService.deleteByIds(ids);
		} else {
			roleService.deleteById(ids);
		}

		return true;
	}

}
