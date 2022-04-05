console.log("Select Approver User Module............");
var SelectApproverService={};

var SelectApproverService = (function() {

	function uppdateAthority(userInfo, callback, error) {
		$.ajax({
			type: 'post',
			url : '/admin/update_authority',
			data : userInfo,
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
					
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	function deleteAthority(userInfo, callback, error) {
		$.ajax({
			type: 'post',
			url : '/admin/delete_authority',
			data : userInfo,
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
					
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	return{
		uppdateAthority:uppdateAthority,
		deleteAthority:deleteAthority
	};
})();
