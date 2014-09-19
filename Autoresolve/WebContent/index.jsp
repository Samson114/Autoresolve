<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>输入提示示例</title>
     <style>
        TD {FONT-SIZE: 12px}
     </style>
     <script language="javascript">
       //创建XMLHttpReques对象
       function createXMLHttpRequest() {
          if (window.XMLHttpRequest) {
               //Mozilla 浏览器 
               XMLHttpReq = new XMLHttpRequest();
            } else{
                // IE浏览器
                if (window.ActiveXObject) {
                  try {
                         XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                      }catch (e) {
                         try {
                                XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                             }catch (e) { }
                      }
                 }
            }
        } 
       //处理服务器响应结果
       function handleResponse() {
        // 判断对象状态
        if (XMLHttpReq.readyState == 4) { 
            // 信息已经成功返回，开始处理信息
           if (XMLHttpReq.status == 200) { 
                clearTable();
                var out = "";
                var res = XMLHttpReq.responseXML;
                var items = res.getElementsByTagName("item");
                for(var i=0;i<items.length;i++)
                {
                   addRow(items(i).firstChild.nodeValue);
                }
                setDivStyle();
             }
         }
       }
       //清除表格中的结果
       function clearTable()
       {
           var content = document.getElementById("content");
           while(content.childNodes.length>0)
           {
               content.removeChild(content.childNodes[0]);
           }    
           
       }
       //向输入提示的表格中添加一行记录   
       function addRow(item)
       {
           var content = document.getElementById("content");
           var row = document.createElement("tr");
           var cell = document.createElement("td");
           cell.appendChild(document.createTextNode(item));
           cell.onmouseover = function(){this.style.background="blue"};
           cell.onmouseout = function(){this.style.background="#f5f5f1"};
           cell.onclick = function(){
          	 document.getElementById("key").value=this.innerHTML;
          	 document.getElementById("suggest").style.visibility="hidden"
	 };
           row.appendChild(cell);
           content.appendChild(row);
           
       }
      //发送客户端的请求
      function sendRequest(url) {
            createXMLHttpRequest();
            XMLHttpReq.open("GET", url, true);
            //指定响应函数
            XMLHttpReq.onreadystatechange = handleResponse;
            // 发送请求
            XMLHttpReq.send(null); 
       }   
       //调用Ajax自动提示功能    
       function suggest()
       {
            var key = document.getElementById("key").value;
            sendRequest("Suggest?key="+key);
       }
       
       //设置输入提示框的位置和风格
       function setDivStyle()
       {
           var suggest = document.getElementById("suggest");
           suggest.style.border = "black 1px solid";
           suggest.style.left = 62;
           suggest.style.top = 50;
           suggest.style.width = 150;
           suggest.style.backgroundColor = "#f5f5f1";
           document.getElementById("suggest").style.visibility="visible";
       }
     </script>
  </head>
  <body>
  <font size="1">
  输入提示示例(可以输入字母a开头的字符串进行测试)<br>
  请输入：
  <input type="text" id="key" name="key" onpropertychange="suggest()"/>
  <div id="suggest" style="position:absolute">
      <table>
         <tbody id="content"></tbody>
      </table>
  </div>
  </font>
  </body>
</html>