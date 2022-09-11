<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<html>
<head>
    <meta charset='UTF8'>
    <title>Show all users</title>
</head>
<ul>
<%
      List<String> names = (List<String>) request.getAttribute("userList");

          for(String name : names){
          out.println(name);
          }
%>
</ul>
</html>