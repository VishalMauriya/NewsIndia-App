<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sources</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<br>
<center>
<h1>Today's Headlines from BBC</h1>
</center>
<br>
<%
	String apiKey = "996b219d54484e368dfbeb6aaeb53d16";
	String newsApiEndPoint = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey="+apiKey;
	
	
	try {
//	1. Create URL
		URL url = new URL(newsApiEndPoint);
		
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
		
			%>
			
			<%
    JSONArray array = object.getJSONArray("articles");
	
	for(int i =0; i<array.length(); i++) {
		JSONObject obj = array.getJSONObject(i);
		System.out.println(obj.getString("title"));
		%>
      <div class="container mt-3">
  <table class="table table-borderless">
    <tbody>
      <tr>
        <td><h2 style="color:red"><%=obj.getString("title")%></h2>
      <h5><%=obj.getString("description")%></h5>
      <h5 style="color:green">Published At: <%=obj.getString("publishedAt")%></h5>
      <div >
      <img src="<%=obj.getString("urlToImage")%>"  alt="imageOfNews" style="width:700px; height:300px;">
      </div>
      <p>Author: <%=obj.get("author")%>, Source: <%=obj.getJSONObject("source").getString("name")%></p>
      <p><%=obj.get("content")%></p>
      <a href="<%=obj.getString("url")%>">read more..</a>
      <br>
      <br>
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