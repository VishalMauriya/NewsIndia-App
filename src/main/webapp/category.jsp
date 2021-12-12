<%@page import="org.json.JSONArray"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<% String action = request.getParameter("action"); %>
<%@include file="components/navbar.jsp" %>

<br>
<center>
<h1>Today's Headlines related <%=action %></h1>
</center>
<br>

	<%
	String apiKey = "996b219d54484e368dfbeb6aaeb53d16";
	String EndPoint = "https://newsapi.org/v2/top-headlines?category="+action+"&apiKey="+apiKey;
	
	
	try {
//	1. Create URL
		URL url = new URL(EndPoint);
		
//	2. Create URL Connection
		URLConnection connection = url.openConnection(); // Hit the End Point
		
//	3. Read JSON Data into Bytes
		InputStream stream = connection.getInputStream();
		BufferedInputStream buffer = new BufferedInputStream(stream);
		
//	3. Convert Bytes into String
		byte[] bytes = buffer.readAllBytes(); // read all bytes together in bytes variable
		String responses = new String(bytes); 
		
		
		// The String response is a Structured Response. Here it is JSON.
			System.out.println(response);
		// We need to represent String as JSON
		// For that we need  JSON .jar file
		
		JSONObject object = new JSONObject(responses);
		
		System.out.println(object.getString("status"));
		System.out.println(object.getInt("totalResults"));
		
	
	    JSONArray array = object.getJSONArray("articles");
		
		for(int i =0; i<array.length(); i++) {
			JSONObject obj = array.getJSONObject(i);
			System.out.println(obj.getString("title"));
		
	%>
	
	<div class="container mt-3">
  <table class="table table-borderless">
    
    <tbody>
      <tr>
        <td><div class="col-sm-8">
      <h2 style="color:red"><%=obj.getString("title")%></h2>
      <h5><%=obj.getString("description")%></h5>
      <h5 style="color:green">Published At: <%=obj.getString("publishedAt")%></h5>
      <div >
      <img src="<%=obj.getString("urlToImage")%>"  alt="imageOfNews" style="width:700px; height:300px;">
      </div>
      <p>Author: <%=obj.get("author")%>, Source: <%=obj.getJSONObject("source").getString("name")%></p>
      <p><%=obj.get("content")%></p>
      <a href="<%=obj.getString("url")%>">read more..</a>
      <br>
    </div>
  </td>
        
      </tr>
    </tbody>
  </table>
</div>
	
	
<%	
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	
	<%@include file="components/footer.jsp" %>
	
</body>
</html>