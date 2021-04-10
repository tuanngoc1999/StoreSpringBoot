
function addToCart(id)
	{
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/damh/api/gio-hang/addSanPham?id="+id,
			success: function(result){
				if(result.status == "false")
				{
					window.alert("Sản phẩm đang hết hàng, quý khách vui lòng quay lại sau");	
				}else
				{
					window.alert("Đã thêm sản phẩm vào giỏ hàng");
				}		
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});

		
	}


$(document).ready(function(){
	ajaxGet();

	function ajaxGet(){
		$.ajax({
			type: "GET",		
			url: "http://localhost:8080/damh/api/san-pham/latest",
			success: function(result){
				var content;
				$.each(result, function(i, sanpham){
					content = '';
							content = '<div class="col-sm-3"><a href="sp?id='+sanpham.id+'">' +
									'<img style="width: 300px; height: 238px" src="/damh/img/'+sanpham.id+'.png">' +
									'<h3 style="font-weight: bold;color:black;">'+sanpham.tenSanPham+'</h3></a>' +
									'<h3>'+accounting.formatMoney(sanpham.donGia)+' VND</h3>'+
									'<button onClick="addToCart('+sanpham.id+')" class="btn btn-info"><span class="glyphicon glyphicon-shopping-cart pull-center"></span> Mua</button>'+
									'<h3></h3>'+
									'</div></br></br>';
									//content = section + content + endsection;
								$('.row').append(content);
				});
			},
			error : function(e){
				alert("Error: ",e);
				console.log("Error" , e );
			}
		});
	}
	
	
	
})
