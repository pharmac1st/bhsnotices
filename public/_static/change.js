function edit_name(el) {

	var newEl = document.createElement('h4');
	newEl.innerHTML = '<input name="editname" style="display: inline-block;"/>';

	el.parentNode.replaceChild(newEl, el);
	document.getElementById('submitname').style.display = "inline-block"


}


function edit_content(el) {

	var newEl = document.createElement('p');
	newEl.innerHTML = '<textarea style="font-size: 30px; margin-left: 0.5rem;" rows="4" cols="50" name="comment"></textarea>';
	el.parentNode.replaceChild(newEl, el);
	document.getElementById('submitcontent').style.display = "block"
	document.getElementById('submitname').style.display = "none"



}

function submit_name() {

	document.getElementById('editf').submit();

}

function show_yrs() {

	document.getElementById('yrs').style.display = "block"

}
