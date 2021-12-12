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
<title>Explore News</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">

<style>
body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: center;
  width: 50%;
  background: #f1f1f1;
}

form.example button {
  float: center;
  width: 10%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>
<style>
.new {
  font-family: "Sofia", sans-serif;
  font-size: 30px;
  text-shadow: 3px 3px 3px #ababab;
}
</style>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<% String query = request.getParameter("query");%>
<br>
  <div class="search-container">
    <form class="example" action="explore.jsp">
<center>
      <input type="text" placeholder="Enter words to search for Related News" name="query">
      <button type="submit">Search</button>
</center>
    </form>
  </div>
<br>

<center>
<h1>News Related to "<%=query%>"</h1>
</center>
<br>

<%	if(query!=null){
	String apiKey = "996b219d54484e368dfbeb6aaeb53d16";
	String newsApiEndPoint = "https://newsapi.org/v2/everything?q="+query+"&apiKey="+apiKey;
	
	
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
	
	}else{
		%>
		<center>
		<h2 class="new" style="margin-top: 200px; margin-bottom: 200px">Please enter words(without space) to search News</h2>
		</center>
		
	<%
		}
	%>
<%@include file="components/footer.jsp" %>

</body>
</html>