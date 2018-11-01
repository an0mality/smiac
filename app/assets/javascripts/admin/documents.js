$(document).ready(function(){

	var All = document.getElementById('checkAll');
	All.onclick = selectAll; 
	
	var AllInput = document.getElementsByClassName('deletedCheck');

	var deleteBtn = document.getElementById('deleteFile');
	deleteBtn.onclick = DeleteFiles;
	
	// for(i=0;i<AllInput.length;i++){
	// 	AllInput[i].onclick = AddArray;
	// };
	
	function selectAll(eventObj){
		console.log('all');

		
		var element = eventObj.target;
		if (element.checked==true){
			setCheckCondition(AllInput, true);			
		}
		else{
			setCheckCondition(AllInput, false);			
		}
	}

	function setCheckCondition(elements, condition){
			for(i=0;i<elements.length;i++){
				elements[i].checked = condition;
			};
	};

	function GetArray(){
		var array = [];
		for(i=0;i<AllInput.length;i++){
			if(AllInput[i].checked == true){
				array.push(AllInput[i].getAttribute('value'));
			}
		};
		return array
	};

	function DeleteFiles(){
		var array = GetArray();
		console.log(array);
		
		$.ajax({
            method: 'POST',
            url:  "/admin/documents/mass_deleting",
            data: {array: array},
            success: function() {
                    alert('Документы удалены');
            },
            error: function () {
                alert('Документы не удалось удалить. Перезагрузите страницу и повторите запрос');
            }
        });
	}

	var closeBtn = document.getElementById('closeBtn');
	closeBtn.onclick = function(){
		console.log('close');
		window.location.reload();
	}





});