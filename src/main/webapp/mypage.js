
function removeMember(){
	var confirmation = confirm("회원탈퇴 하시겠습니까?");

	if (confirmation) 
    	window.location.href = "delete_member_process.jsp";
}