function allyearscheck(box) {

	var years = ["y9", "y10", "y11", "y12", "y13"]
	var arrayLength = 5

	for (var i = 0; i < arrayLength; i++) {
		document.getElementById(years[i]).checked = true;
	}

	if (box.checked == false) {

		for (var i = 0; i < arrayLength; i++) {
			document.getElementById(years[i]).checked = false;
		}


	}

}

function uncheckind(box) {

	var years = ["y9", "y10", "y11", "y12", "y13"]
	var arrayLength = 5
	var off = 0

	if (box.checked == false) {

		document.getElementById("allyear").checked = false;

	}

	for (var i = 0; i < arrayLength; i++) {
		if (document.getElementById(years[i]).checked == true) {

			off += 1

		}



	}

	if (off == 5) {

		document.getElementById("allyear").checked = true;


	}


}
