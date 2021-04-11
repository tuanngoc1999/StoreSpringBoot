calculateOrder()
var total=0;
function calculateOrder()
{
	var element = document.getElementsByClassName("total");
	var res = 0;
	for (i = 0; i < element.length; i++) {
		res = res + parseInt(element[i].textContent);
	}
	var element2 = document.getElementById("ordertotal");
	
	resConvert = accounting.formatMoney(res);
	element2.innerHTML = resConvert+ " VND";
	var element3 = document.getElementById("tongGiaTri");
	element3.setAttribute("value",res);
	total = element3;
	if(res == 0)
	{
		document.getElementById("submit").disabled = true;		
	}	
}
function sendOrder(id)
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/damh/api/don-hang/addOrder?id="+id,
			success: function(result){
				if(result.status != "success")
				{
					window.alert("Error!");	
				}else
				{
					window.alert("Đã gửi đơn hàng thành công");
				}		
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});

		
	}

