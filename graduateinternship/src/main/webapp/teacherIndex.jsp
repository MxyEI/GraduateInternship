<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>实习管理系统主页(实习管理部门)</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<body class="easyui-layout">
	<div region="north" style="height: 50px; background-color: #ffff">
		<table width="100%">
			<tr>
				<td width="50%"
					style="font-size: 30px; color: #8B8B8B; font-family: '楷体';">实习管理系统（实习管理部门）</td>
				<td valign="bottom"
					style="font-size: 20px; color: #8B8B8B; font-family: '楷体';"
					align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>当前登录用户：</strong></font>
					<a id="username" style="font-size: 28px"></a></td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs"></div>
	</div>
	<div region="west" style="width: 200px; height: 500px;" title="导航菜单"
		split="true">
		<div class="easyui-accordion">
			<div title="信息管理"
				data-options="selected:true,iconCls:'icon-wenzhangs'"
				style="padding: 10px; height: 10px;">
				<a href="javascript:openTab(' 个人信息','userInfo.jsp','icon-wenzhang')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-wenzhang'"
					style="width: 150px;"> 个人信息</a> <a
					href="javascript:openTab(' 修改密码','updatePassword.jsp','icon-wenzhang')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-wenzhang'"
					style="width: 150px;">修改密码</a>
			</div>

			<div title="审核管理"
				 data-options="selected:true,iconCls:'icon-wenzhangs'"
				 style="padding: 10px; height: 10px;">
				<a href="javascript:openTab(' 审核单位信息','shenhecombytea.jsp','icon-wenzhang')"
				   class="easyui-linkbutton"
				   data-options="plain:true,iconCls:'icon-wenzhang'"
				   style="width: 150px;"> 审核单位信息</a>
				<a href="javascript:openTab(' 审核岗位','shenhegangwei.jsp','icon-wenzhang')"
				   class="easyui-linkbutton"
				   data-options="plain:true,iconCls:'icon-wenzhang'"
				   style="width: 150px;"> 审核岗位信息</a>
			</div>

			<div title="实习管理"
				data-options="selected:true,iconCls:'icon-wenzhangs'"
				style="padding: 10px; height: 10px;">
				<%--<a href="javascript:openTab(' 实习评价','teacherScoreInfo.jsp','icon-wenzhang')"--%>
					<%--class="easyui-linkbutton"--%>
					<%--data-options="plain:true,iconCls:'icon-wenzhang'"--%>
					<%--style="width: 150px;"> 实习评价</a>--%>
				<a href="javascript:openTab(' 实习评价表','companyAssessInfo.jsp','icon-wenzhang')"
				   class="easyui-linkbutton"
				   data-options="plain:true,iconCls:'icon-wenzhang'"
				   style="width: 150px;"> 实习评价表</a>
				<a href="javascript:openTab(' 实习鉴定标准','appraisalform.jsp','icon-wenzhang')"
				   class="easyui-linkbutton"
				   data-options="plain:true,iconCls:'icon-wenzhang'"
				   style="width: 150px;"> 实习鉴定标准</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-item'"
				style="padding: 10px; border: none;">
				<a href="javascript:logout()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">
					安全退出</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	checkCookie();
	loginRedirect();
	function loginRedirect() {
		var usertype = getCookie("usertype");
		switch (usertype) {
		case 'teacher':
			break;
		case 'company':
			window.location.href = "${pageContext.request.contextPath}/companyIndex.jsp";
			break;
		case 'admin':
			window.location.href = "${pageContext.request.contextPath}/adminIndex.jsp";
			break;
		default:
			window.location.href = "${pageContext.request.contextPath}/index.jsp";
		}
	}
	var url;
	function addTab(url, text, iconCls) {
		var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/views/"
				+ url + "'></iframe>";
		$("#tabs").tabs("add", {
			title : text,
			iconCls : iconCls,
			closable : true,
			content : content
		});
	}

	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("close", text);
			addTab(url, text, iconCls);
			$("#tabs").tabs("select", text);
		} else {
			addTab(url, text, iconCls);
		}
	}

	function logout() {
		$.messager.confirm("系统提示", "您确定要退出系统吗", function(r) {
			if (r) {
				clearCookie();
			}
		});
	}
	$("#username").text(getCookie("username"));
</script>
</html>