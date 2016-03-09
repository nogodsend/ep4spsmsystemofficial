<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();%>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>java UI 框架测试</title>
 
 <script src="../assets/js/includeCSS.js"></script>
</head>
<body class="sticky-header">
<section>
   <jsp:include page="../master/left-side.jsp" />
    
    <!-- main content start-->
    <div class="main-content" >

         <jsp:include page="../master/header-section.jsp" />

        <div class="wrapper">
            
		</div>
       

        <!--footer section start-->
         <jsp:include page="../master/footer-section.jsp" />
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

 <script src="../assets/js/includeJS.js"></script>

</body>
</html>