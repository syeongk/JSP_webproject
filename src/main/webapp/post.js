function autoResizeTextarea(textarea) {
	textarea.style.height = 'auto'; 
	textarea.style.height = (textarea.scrollHeight+15) + 'px';
}

document.addEventListener('DOMContentLoaded', function() {
	const textarea = document.getElementById('comment-textarea');
	textarea.addEventListener('input', function() {
		autoResizeTextarea(textarea);
	});
	autoResizeTextarea(textarea);
});

function onComment() {
	var commentForm = document.getElementById("comment-on-form");
	var commentText = document.getElementById("comment-textarea");

	if (commentText.value == "") {
		alert("댓글을 입력해주세요");
		commentText.select();
		return false;
	}
	else
		commentForm.submit();
}

document.addEventListener('DOMContentLoaded', autoResize);

// textarea의 높이를 자동으로 조정하는 함수
function autoResize() {
	const textarea = document.getElementById('post-textarea');
	textarea.style.height = 'auto'; // 높이를 자동으로 조정
	textarea.style.height = textarea.scrollHeight + 'px'; // 스크롤 높이만큼 조정
}