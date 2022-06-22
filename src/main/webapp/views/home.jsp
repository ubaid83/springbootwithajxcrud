<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html lang="en">
<head>
	   <script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">


<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Registration Form</title>
</head>
<body>

	<h1 style="color: blue;" class="text-center">Registration Form</h1>

	<div class="container m-auto mt-5 row">
		<!-- <form class="row" action="/datainsert" method="post"  enctype="multipart/form-data"> -->
		<div class="col-md-4">
			<div class="form-group mt-3"><input
					type="hidden" class="form-control mt-2" id="id" name="id"
					placeholder="Enter the Name">
				<label for="name" class="text-center">Name </label> <input
					type="text" class="form-control mt-2 empty" id="name" name="name"
					placeholder="Enter the Name">
			</div>
		</div>

		<div class="col-md-4">
			<div class="form-group mt-3">
				<label for="email" class="text-center">Email address</label> <input
					type="text" class="form-control mt-2 empty" id="email" name="email"
					placeholder="name@example.com">
			</div>

		</div>
		<div class="col-md-4">
			<div class="form-group mt-3">
				<label for="mobileNo" class="text-center">MobileNo</label> <input
					type="text" class="form-control mt-2 empty" id="mobileNo" name="mobileNo"
					placeholder="Enter the Mobile No">
			</div>
		</div>



		<div class="col-md-4">
			<div class="form-group mt-3">
				<label for="date" class="text-center">Date</label>
				<div class='input-group' placeholder="Enter the Date ">
					<input type="date" id="date" name="date" class="form-control mt-2 empty" />
				</div>
			</div>
		</div>


		<div class="col-md-4">
			<div class="form-group mt-3">
				<label for="address" class="text-center">Address</label> <input
					type="text" class="form-control mt-2 empty" id="address" name="address"
					placeholder=" Enter the Address">
			</div>
		</div>



		<div class="col-md-4">
			<div class="form-group mt-3">
				<label for="exampleFormControlSelect1" class="text-center">SelectCountry
				</label> <select class="form-control mt-2 empty" id="country" name="country">
					<option >Select</option>
					<option value="Afghanistan">Afghanistan</option>
					<option value="Australia">Australia</option>
					<option value="Ireland">Ireland</option>
					<option value="India">India</option>
					<option value="Bangladesh">Bangladesh</option>
				</select>
			</div>
		</div>



	
		
	

		<button type="button" class="btn btn-primary mt-4 saveData">Add</button>
		<button type="button" class="btn btn-primary mt-4 updateData d-none">Update</button>
	    </div>






	        <div class="container m-auto">
		    <h4 style="color: green";>Employee List</h4>

            <table class='table table-bordered' id="userTable">
						<thead>
						<tr>
						    <th scope="row">ID</th>
							<th scope="row">Name</th>
							<th scope="row">Email</th>
							<th scope="row">MobileNo</th>
							<th scope="row">Date</th>
							<th scope="row">Address</th>
							<th scope="row">Country</th>
							<th scope="row">Delete</th>
							<th scope="row">Edit</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
                  </table>

		
	             </div>
          </body>
          
          
   <script>
   $(document).ready(function(){
	getAllRecords()
	$(".saveData").on('click',function(){
	let name = $("#name").val()
	let email = $("#email").val()
	let mobileNo = $("#mobileNo").val()
	let date = $("#date").val()
	let address = $("#address").val()
	let country = $("#country").val()
	

	
	   let obj  = {
			name: name,
			email: email,
			mobileNo: mobileNo,
			date: date,
			address: address,
			country: country
	         }

	    	
	    	
	    //for Data add databases
	    	
	      $.ajax({
		  type: "POST",
		  url: "/datainsert",
		  contentType: "application/json; charset=utf-8",
		  data: JSON.stringify(obj),
		  success: function(resp){
			  $(".empty").val("")
			  console.log('RESPONSE::::::::::', resp)
			   AjaxTable(resp)
		  },
		    error:function(error){
			  console.log('EROORRRRRR:::::::::::', error)
		  },
		  dataType: 'JSON'
		
		});
	
	})
	
	/// all record get 
	
	  function getAllRecords(){
		     $.ajax({
			  type: "POST",
			  url: "/getAllrecord",
			  contentType: "application/json; charset=utf-8",
			  data: {},
			  success: function(resp){
				  
				  let htmltbel = ``
				  resp.forEach(function(item){
					  console.log('RESPONSE::::::::::', item.name)
					  htmltbel += `<tr id="data-id" >
						  <td >\${item.id}</td>
							<td>\${item.name}</td>
							<td>\${item.email }</td>
							<td>\${item.mobileNo}</td>
							<td>\${item.date}</td>
							<td>\${item.address}</td>
							<td>\${item.country}</td>
							<td><a   class="btn btn-danger deletebtn" data-id="\${item.id}">Delete</a></td>
							<td><a class="btn btn-danger editbtn" data-id="\${item.id}">Edit</a></td>
						</tr>`
				          })
					  $('#userTable tbody').html(htmltbel)
                        },
			        error:function(error){
				  console.log('EROORRRRRR:::::::::::', error)
			       },
			     dataType: 'JSON'
			    });
	         }
	

	
	
	
	
	//for deleteRecord data
	
	
	
	$("#userTable").on('click','.deletebtn',function(){
		let idaa = $(this).attr('data-id');
		let ida = parseInt(idaa);
		console.log(ida)
		
		     $.ajax({
			  type: "POST",
			  url: "/deleteRecord?id="+ida,
			  contentType: "application/json; charset=utf-8",
			  data: {
				id:ida
			  },
			  success: function(resp){
				  AjaxTable(resp)
                 },
			  error:function(error){
			 console.log('EROORRRRRR:::::::::::', error)
			  },
			  dataType: 'JSON'
			});
		});
	
	
	
	
	       //for Eidt page
	    $("#userTable").on('click','.editbtn',function(){ 
		   $(".saveData").addClass('d-none')
		   $(".updateData").removeClass('d-none')
			let id = $(this).attr('data-id');
			let id1 = parseInt(id);
			console.log('id::::::::::',id1)

	      $.ajax({
		  type: "POST",
		  url: "/editStudentForm?id="+id1,
		  contentType: "aplication/JSON;charset=utf-8",
		  data:{
			  id: id
		  },
		  success:function(resp){
			
			$("#id").val(resp.id)
			$("#name").val(resp.name)
			$("#country").val(resp.country)
			$("#date").val(resp.date)
			$("#address").val(resp.address)
			$("#email").val(resp.email)
			$("#mobileNo").val(resp.mobileNo)
		  },
		  error:function(){
			  
		alert("Do You not edit error page ")
		  }
		  
		  
	  })
	   })
	   
	  //for DataUapated time  add in databases
     $(".updateData").on('click',function(){
    	   $(".updateData").addClass('d-none')
		   $(".saveData").removeClass('d-none')
	let name = $("#name").val()
	let email = $("#email").val()
	let mobileNo = $("#mobileNo").val()
	let date = $("#date").val()
	let address = $("#address").val()
	let country = $("#country").val()
	let id = $("#id").val()

	
	   let obj  = {
			id:id,
			name: name,
			email: email,
			mobileNo: mobileNo,
			date: date,
			address: address,
			country: country
	         }

	    	
	    	console.log('JSON:::::::::::',JSON.stringify(obj))
	  
	    	
	      $.ajax({
	    	
		  type: "POST",
		  url: "/UpdateStudentRecord",
		  contentType: "application/json; charset=utf-8",
		  data: JSON.stringify(obj),
		 
		  success: function(resp){
			  $(".empty").val("")
			  console.log('RESPONSE::::::::::', resp)
			  getAllRecords()
		  },
		    error:function(error){
		    	//  $(".empty").val("")
			  console.log('EROORRRRRR:::::::::::', error)
		  },
		  dataType: 'JSON'
		
		});
	
	})
	   
	   
	function AjaxTable(resp){
		  let htmltbel = ``
			  resp.forEach(function(item){
				  console.log('RESPONSE::::::::::', item.name)
				  htmltbel += `<tr id="data-id" >
					  <td >\${item.id}</td>
						<td>\${item.name}</td>
						<td>\${item.email }</td>
						<td>\${item.mobileNo}</td>
						<td>\${item.date}</td>
						<td>\${item.address}</td>
						<td>\${item.country}</td>
						<td><a   class="btn btn-danger deletebtn" data-id="\${item.id}">Delete</a></td>
						<td><a class="btn btn-danger editbtn" data-id="\${item.id}">Edit</a></td>
					</tr>`
			          })
				  $('#userTable tbody').html(htmltbel)
	  }
	   
	  
	  
	
	
})
</script>


</html>