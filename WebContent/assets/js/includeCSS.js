/*********************************************************************** 
* Title       : 包含其它 css 文件。 
* Description : 将其它 css 文件引入本文件中，方便管理、维护。 
* Author      ： HAPH 
* Date        ：2016-3-7 
************************************************************************/  
function include_css(path)   
{       
    var styleFile=document.createElement("link");   
    styleFile.rel = "stylesheet";  
    styleFile.type = "text/css";  
    styleFile.href = path;  
    
    var head = document.getElementsByTagName('head')[0];   
    head.appendChild(styleFile); 
    
    
}


//必要的样式
include_css("../assets/component/bootstrap-3.3.5/css/bootstrap.min.css");
include_css("../assets/component/bootstrap-3.3.5/css/bootstrap-reset.css");
include_css("../assets/component/jquery-ui-1.11.4/jquery-ui.min.css");
include_css("../assets/component/font-awesome-4.5.0/css/font-awesome.min.css");

//插件样式
include_css("../assets/component/dataTables-1.10.11/css/dataTables.bootstrap.css");
include_css("../assets/component/dataTables-1.10.11/css/dataTables-reset.css");
include_css("../assets/component/icheck-1.x/skins/all.css");
include_css("");


//自定义样式
include_css("../assets/css/style-responsive.css");
include_css("../assets/css/style.css");