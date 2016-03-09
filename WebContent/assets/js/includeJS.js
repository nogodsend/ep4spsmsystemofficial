/*********************************************************************** 
* Title       : 包含其它 js 文件。 
* Description : 将其它 Js 文件引入本文件中，方便管理、维护。 
* Author      ： HAPH 
* Date        ：2016-3-7 
************************************************************************/  
function include_js(path)   
{       
      var jsFile = document.createElement('script');   
      jsFile.type = "text/javascript";   
      jsFile.src = path;   
      var head = document.getElementsByTagName('body')[0];   
      head.appendChild(jsFile);   
} 


//必要的js
include_js("../assets/component/jquery/jquery-1.10.2.min.js");
include_js("../assets/component/jquery-ui-1.11.4/jquery-ui.min.js");
include_js("../assets/component/jquery/jquery-migrate-1.2.1.min.js");
include_js("../assets/component/bootstrap-3.3.5/js/bootstrap.min.js");
include_js("../assets/component/modernizr.min.js");
include_js("../assets/component/jquery/jquery.nicescroll.js");
include_js("../assets/component/json/json2.js");

//插件js
include_js("../assets/component/dataTables-1.10.11/js/jquery.dataTables.min.js");
include_js("../assets/component/dataTables-1.10.11/js/dataTables.bootstrap.min.js");
include_js("../assets/component/handlebars-v3.0.1.js");
include_js("../assets/component/icheck-1.x/icheck.min.js");
include_js("");

////自定义js
include_js("../assets/js/outlook.js");