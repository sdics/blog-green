<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<input id="id" type="hidden" value="${users.id}"/>
	<button id="btnDelete" class="btn btn-danger">회원탈퇴</button>
	<form>
		<div class="mb-3 mt-3">
			<input type="text" class="form-control" placeholder="Enter username" value="${users.username}" readonly="readonly">
		</div>
		<div class="mb-3">
			<input id="password" type="password" class="form-control"
				placeholder="Enter password" value="${users.password}">
		</div>
		<div class="mb-3">
			<input id="email" type="email" class="form-control" placeholder="Enter email" value="${users.email}">
		</div>
		<button id="btnUpdate" type="button" class="btn btn-primary">회원수정완료</button>
	</form>
</div>

<script>
$("#btnDelete").click(() =>{
	let id = $("#id").val();
	
   $.ajax("/users/"+id,{
         type: "DELETE",
         dataType: "json"
      }).done((res)=>{
         if(res.code == 1){
        	 alert("회원 탈퇴 완료")
            location.href = "/";
         }else{
        	 alert("업데이트에 실패하였습니다");
         }
      });
});

	$("#btnUpdate").click(() =>{
		let data = {
				password: $("#password").val(),
				email: $("#email").val()
		};
		
		let id = $("#id").val();
		
	   $.ajax("/users/"+id,{
	         type: "PUT",
	         dataType: "json",
	         data: JSON.stringify(data),
	         headers : {
	               "Content-Type" : "application/json; charset=utf-8"   //json 타입 컨텐트 타입 날릴꺼야!
	         }
	      }).done((res)=>{
	         if(res.code == 1){
	        	 alert("회원 수정 완료")
	            location.reload(); // F5
	         }else{
	        	 alert("회원탈퇴 실패");
	         }
	      });
	});
</script>


<%@ include file="../layout/footer.jsp"%>

