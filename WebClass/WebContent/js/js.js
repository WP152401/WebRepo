/**
 * 
 */
$(document).ready(function() {
			$('#LoginForm').submit(function(event) {
				event.preventDefault();

				var id = $('#id').val();
				var pwd = $('#pwd').val();

				$.post("http://httpbin.org/post", 
						{id : id, pwd : pwd}, 
						function(data) {
							var myModal = $('#myModal');
							myModal.modal();
							myModal.find('.modal-body').text(data.form.id + '님 로그인되었습니다');
						});
			});
			
			$('#SignInForm').submit(function(event) {
				event.preventDefault();

				var name = $('#name').val();

				$.post("http://httpbin.org/post", 
						{name : name}, 
						function(data) {
							var myModal = $('#myModal');
							myModal.modal();
							myModal.find('.modal-body').text(data.form.name + '님 회원가입되었습니다');
						});
			});
			
		});