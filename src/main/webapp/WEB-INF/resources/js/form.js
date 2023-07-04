const VISIBLE = "visible"
const HIDE = "hidden"

function onChange(){
 var title = document.getElementById('inputTitle').value
 var description = document.getElementById('inputDescription').value
 var button = document.getElementById('submitBtn')
 var errorMsg = document.getElementById('customError')
 if(title.length<1){
 button.disabled = true
 errorMsg.style.visibility = VISIBLE
 	return;
 }
 if(description.length<1){
 button.disabled = true
 errorMsg.style.visibility = VISIBLE
 return;
 }
  errorMsg.style.visibility = HIDE
  button.disabled = false
}