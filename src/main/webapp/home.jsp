<%@page import="java.util.Locale"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Locale.IsoCountryCode"%>
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
<title>News</title>
 <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
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
<%
	String query = request.getParameter("query");
	String countryName = request.getParameter("myCountry");

Map<String, String> countries = new HashMap<>();
for (String iso : Locale.getISOCountries()) {
  Locale l = new Locale("", iso);
  countries.put(l.getDisplayCountry(), iso);
}

	String countryCode = countries.get(countryName);
System.out.println(countries.get(countryName));

%>
<%
	String apiKey = "996b219d54484e368dfbeb6aaeb53d16";
	String newsApiEndPoint = "null";

	if(query==null){
		query = "";
		if(countryName == null){
			newsApiEndPoint = "https://newsapi.org/v2/top-headlines?country=IN&apiKey="+apiKey;
			countryName = "India";
		}else{
			newsApiEndPoint = "https://newsapi.org/v2/top-headlines?country="+countryCode+"&apiKey="+apiKey;
		}
	}else{
		 newsApiEndPoint = "https://newsapi.org/v2/everything?q="+query+"&apiKey="+apiKey;
		 countryName = "";
	}
	
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
			
	
<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h2>News India</h2>
      <h5>Be the first to see news</h5>
      <div >
      	<video width="350" height="200" autoplay muted>
  <source src="images/nb.mp4" type="video/mp4">
</video>
      </div>
      <p>News India is an indian news app</p><br>
      
      <h3>See the news by country..</h3>
      
      <form autocomplete="off" action="home.jsp">
  <div class="autocomplete" style="width:260px;">
    <input id="myInput" type="text" name="myCountry" placeholder="Country Name" value=<%=countryName %>>
  </div>
  <input type="submit" value="See">
</form>
<br>
      <h3>See the news by category..</h3>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
        <center>
          <p class="nav-link active">category</p>
          </center>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=business">business</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=entertainment">entertainment</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=technology">technology</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=science">science</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=sports">sports</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=health">health</a>
         </li>
        <li class="nav-item">
          <a class="nav-link" href="category.jsp?action=general">general</a>
         </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    
    <div class="col-sm-8" >
    <h2 style="margin-left:30px">Today's Headlines (<%=countryName %>)</h2><br>
		
		<br>
  <div class="search-container">
    <form class="example" action="home.jsp">
<center>
      <input type="text" placeholder="Enter words to search for Related News" name="query" value=<%=query %>>
      <button type="submit">Search</button>
</center>
    </form>
  </div>
<br>
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
    </div>
  </div>
</div>
<%	
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<%@include file="components/footer.jsp" %>
	<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var countries = ["United Arab Emirates","Argentina","Australia","Austria","Belgium",
					"Brazil","Bulgaria","Cambodia","Canada","China","Colombia","Switzerland",
					"Cuba","Czech Republic","Germany","Egypt","France","United Kingdom","Greece","Hong Kong",
					"Hungary","Indonesia","Ireland","Israel","Italy","India","South Korea","Japan","Latvia","Lithuania","Malaysia",
					"Morocco","Mexico","Netherlands","Nigeria","Norway","New Zealand","Philippines","Poland","Portugal",
					"Romania","Russian Federation","Serbia","Saudi Arabia","Singapore","Sweden","Slovakia","Slovenia","Thailand",
					"Turkey","Taiwan","Ukraine","United States","South Africa","Venezuela"];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>
</body>
</html>