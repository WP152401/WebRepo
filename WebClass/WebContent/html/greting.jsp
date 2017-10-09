<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <title>Bootstrap 실습</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
  	<script>
  	function manu_over(e){
  		e.setAttrubute("class", "nav-item active");
  	}
  	function manu_out(e){
  		e.setAttrubute("class", "nav-item");
  	}
  	</script>
  	<style>
  	div.container{
  		padding-top: 30px
  		
  	}
  	</style>
  </head>
  <body>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
     <a class="navbar-brand" href="#">Home</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
   
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <ul class="navbar-nav mr-auto">
         <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
           <a class="nav-link" href="../html/p.html">메뉴1 <span class="sr-only">(current)</span></a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="../html/a.html">메뉴2</a>
         </li>
         <li class="nav-item">
           <a class="nav-link disabled" href="../html/dom.html">메뉴3</a>
         </li>
       </ul>
       <form class="form-inline my-2 my-lg-0" id="LoginForm">
         <input class="form-control mr-sm-2" type="text" placeholder="ID" aria-label="ID" id="id" required>
          <input class="form-control mr-sm-2" type="password" placeholder="PWD" aria-label="PWD" id="PWD" required>
         <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
       </form>
     </div>
   </nav>
    <h1>Hello, Bootstrap!</h1>
    <div class="container">
	<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>
    </div>
    <!-- 모달창 -->
    <div class="modal" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">로그인 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <script>
  $(document).ready(function(){
	  $('#loginForm').submit(function(event){
		  // submit되는 것을 막기
		  event.preventDefault();
		  
		 console.log('start');
		  //id,pwd 가져오기 
		 var id = $("#id").val();//document.getElementById("id").value
		 var pwd = $("#pwd").val();
		 console.log(id,pwd);
		 
		 //서버로 post 방식 전송
		 $.post("http://httpbin.org/post",
		 {id:id,pwd:pwd},
		 function(data){
			//서버로 부터 응답을 받으면 
			//alert(data.form.id+'님 로그인 되었습니다.');
			var myModal=$('#myModal');
			myModal.modal();
			myModal.find('.modal-body').text(data.form.id+'님 로그인 되었습니다.');
			
		 });
	  });
  });
  
  // simple
  $(function(){
	  
  });
  </script>
  
  </body>
</html>