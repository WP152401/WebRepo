$(document).ready(function(){
	$('#form').submit(function(event){
	console.log()
	event.preventDefault()
	var my_modal= $('#mymodal')
	var id = $('#name').val()
	my_modal.modal()
	my_modal.find('.modal-body').text(id+"님 회원가입되었습니다.")
	});
});