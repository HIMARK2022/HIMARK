console.log("Select Temp Approver Service Module............");
var SelectTempApproverService={};

var SelectTempApproverService = (function() {

	function selectTempApprover(TempInfo, callback, error) {
		$.ajax({
			type: 'post',
			url : '/admin/select_temp_approver',
			data : TempInfo,
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

	function getTempManagerList(dept_id ,callback, error) {
		console.log("전달받는 값"+dept_id)
		$.getJSON('/admin/check_temp?dept_id=' +dept_id,
			function(data) {
				if(callback) {
					callback(data); 
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	function getDelManagerList(dataInfo ,callback, error) {
		$.ajax({
			type: 'post',
			url : '/admin/del_temp',
			data : dataInfo,
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
	
	function getHeadList(head ,callback, error) {
		console.log("전달받는 값"+head)
		$.getJSON('/admin/temp_head?head=' +head,
			function(data) {
				if(callback) {
					callback(data); 
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	function getDepartList(depart ,callback, error) {
		console.log("전달받는 값"+depart)
		$.getJSON('/admin/temp_depart?depart=' +depart,
			function(data) {
				if(callback) {
					callback(data); 
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	function getTeamList(team ,callback, error) {
		console.log("전달받는 값"+team)
		$.getJSON('/admin/temp_team?team=' +team,
			function(data) {
				if(callback) {
					callback(data); 
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	return{
		selectTempApprover:selectTempApprover,
		getTempManagerList:getTempManagerList,
		getDelManagerList:getDelManagerList,
		getHeadList:getHeadList,
		getDepartList:getDepartList,
		getTeamList:getTeamList
	};
})();
