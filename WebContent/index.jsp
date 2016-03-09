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
 
 

  <!--common-->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/style-responsive.css" rel="stylesheet">
</head>
<body class="sticky-header">
<section>
   <jsp:include page="Views/master/left-side.jsp" />
    
    <!-- main content start-->
    <div class="main-content" >

         <jsp:include page="Views/master/header-section.jsp" />

        <jsp:include page="Views/master/content.jsp" />
       

        <!--footer section start-->
         <jsp:include page="Views/master/footer-section.jsp" />
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
<script src="assets/component/jquery/jquery-1.10.2.min.js"></script>
<script src="assets/component/jquery-ui-1.11.4/jquery-ui.min.js"></script>
<script src="assets/component/jquery/jquery-migrate-1.2.1.min.js"></script>

<script src="assets/component/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="assets/component/modernizr.min.js"></script>
<script src="assets/component/jquery/jquery.nicescroll.js"></script>
<script src="assets/js/scripts.js"></script>

</body>
</html>