
var ID = ""
function onDelete(id,title){
console.log(id)
ID = id
const myModal = new bootstrap.Modal('#exampleModal', {
  keyboard: false
})
var messageBody = document.getElementById('confirmMessage')
messageBody.innerHTML = `Note <b>${title}</b> will be deleted`
myModal.show()
}

function onConfirmDelete(){
 var deleteNote =  document.getElementById(ID)
 deleteNote.click()
}