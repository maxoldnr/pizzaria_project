function confirmAction(form){
	var rep = confirm("Etes vous certain de réaliser cette action ?");
	if(rep){
		//var x = document.getElementsByName(formName);
		//x[0].submit();
		document.forms[0].submit();
	}
}


/*function toggle(pizza){
  var thisPizza = document.getElementById(pizza);
  thisPizza.checked = !thisPizza.checked;  
}*/
//<img class="img" src="http://s5.tinypic.com/30v0ncn_th.jpg" id="img1" onclick="toggle('img1_cb')" />


/*document.getElementById('img2').onclick = function () //attach to onclick
{                             
        var checkbox = document.getElementById('chk2'); //find checkbox

        checkbox.checked = !checkbox.checked; //toggle the checked status
}*/

//<label for="img1"><img class="img" src="http://s5.tinypic.com/30v0ncn_th.jpg" /></label>
//<input type="checkbox" class="chk " checked="checked" id="img1" name="img1" value="0" />