/**
 * 
 */
function checkBoard(){
	if(document.frm.name.value.length===0){
		alert("작성자를 입력하세요.");
		frm.name.focus();
		return false;
	}
	if(document.frm.pass.value.length===0){
		alert("암호를 입력하세요.");
		frm.price.focus();
		return false;
	}
	if(document.frm.title.value.length===0){
		alert("제목을 입력하세요.");
		frm.price.focus();
		return false;
	}
	return true;
}