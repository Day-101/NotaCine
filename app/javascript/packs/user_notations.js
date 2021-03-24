let notationLi = document.querySelectorAll("div div ul li")
let notations = document.querySelectorAll(".js-notation");

notations.forEach(notation => {
	notation.style = "display: none;"
})

function onTitleClick(e){
	element = this.nextElementSibling
	if(element.style.display === "flex"){
		element.style = "display: none;"
	}else{
		element.style = "display: flex;"
	}
}

notationLi.forEach(title =>{title.addEventListener("click", onTitleClick)})