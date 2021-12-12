<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
   background-color: #0B9895;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>
</head>
<body>

<div class="about-section">
  <h1>A B O U T</h1>
  <br><p>When fake news is repeated, it becomes difficult for the public to discern what's real!</p>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">newsIndia</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sources.jsp">Source - BBC News</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="explore.jsp">Explore More</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="about.jsp">About</a>
      </li>    
    </ul>
  </div>  
</nav>

<h2 style="text-align:center">My Self</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="images/project.png" alt="Project Section" style="width:100%">
      <div class="container">
        <p class="title">Some Other Projects</p>
        <p># Expenseo -		<a href="https://github.com/VishalMauriya/Expenseo">view</a></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="images/ms.jpg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Vishal Mauriya</h2>
        <p class="title">Java developer | Android App developer</p>
        <p>IT Student @ Guru nanak Dev Engineering College<br><br><center><a style="color: #007bb5;font-size: 35px;" href="https://www.linkedin.com/in/vishal-mauriya/" class="fa fa-linkedin"></a> &#160; &#160; &#160; &#160; &#160;
<a style="color: black; font-size: 35px;" href="https://github.com/VishalMauriya" class="fa fa-github"></a>&#160; &#160; &#160; &#160; &#160;
<a style="color: #55ACEE; font-size: 35px;" href="https://www.twitter.com/__vishal004__/" class="fa fa-twitter"></a>&#160; &#160; &#160; &#160; &#160;
<a style="color: red; font-size: 35px;"href="https://www.instagram.com/__vishal004__/" class="fa fa-instagram"></a>&#160; &#160; &#160; &#160; &#160;</center></p>
        <p>vishalm7973@gmail.com</p>
        <a href="https://myportprofile.blogspot.com/"><button class="button">Portfolio</button></a>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="images/skill.jpg" alt="Skills" style="width:100%">
      <div class="container">
       <p class="title">Skills & Technologies used in project</p>
        <p># Java<br># Html<br># Css<br></p>
      </div>
    </div>
  </div>
</div>

<%@include file="components/footer.jsp" %>

</body>
</html>