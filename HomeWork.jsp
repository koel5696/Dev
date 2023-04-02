<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실습 3-2</title>
<style>
    .container {
		width: 70%;
		margin: 0 auto;
		background-color: sandybrown;
		padding: 20px;
		box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3); }
	body {
			font-family: "Nanum Gothic", sans-serif;
			padding: 30px; }
	.container1 {
	 height: 40px;
	 display: flex;
	 padding: 10px; }
	h2 {
		font-family: Arial;
        font-size: 28px;
		text-aglin: left;
		margin-left: 40px; }
	input[type="text"] {
            width: 100%;
			font-size: 15px;
			border: none;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px; }
	button {	
			width: 100px;
			background-color: blue;
			border: none;
			color: white;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
			font-size: 16px;
			cursor: pointer; }
 button:hover {
  background-color: lightblue; }
     ul {
        list-style: none;
        padding: 0;
      }
      li {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
        padding: 10px;
        background-color: #f1f1f1;
        border-radius: 5px;
      }
     
      li button {
 		background-color: transparent;
  		color: red;
  		border: none;
  		font-weight: bold; 
  		fioat: right;   }
  		
  	
</style>
</head>
<body>
   <div class = "container">
	<h2>My ToDo App</h2>
	  <hr>
	  <div class = "container1">
		<input id = "item" type = "text" placeholder = "할일을 입력하세요..">
		<button type = "button" id = "add" onclick = "addItem()">할일 추가</button>
	</div>
 	  <hr>
	<ul id="todolist"></ul>
  </div>
  <script>
  let App = [];
  
  function addItem() {
	  let item = document.getElementById("item");
	  let list = document.getElementById("todolist");
  	  let xbtn = document.createElement("button");
  	  xbtn.innerHTML = "X";
  	  let listItem = document.createElement("li");
  	  
  	  let todo = item.value.trim();
  	   App.push(todo);
	  
  	
  	  listItem.innerHTML = '<span>' + todo + '</span>';
  	  listItem.appendChild(xbtn);
  	  list.appendChild(listItem);

  	  xbtn.onclick = function(e) { //삭제버튼
  	    let pnode = e.target.parentNode;
  	    let index = Array.from(pnode.parentNode.children).indexOf(pnode);
  	    App.splice(index, 1);
  	    list.removeChild(pnode);
  	  }	
	 
	 item.value = "";
	 item.focus;
  }
  </script>
</body>
</html>