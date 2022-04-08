console.log("승인자의 임시 승인자 지정............");
var ApproverTempSelect={};

var ApproverTempSelect = (function() {	
	
	function getTeamList(team ,callback, error) {
		console.log("전달받는 값"+team)
		$.getJSON('/approver/check_team?team=' +team,
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
	
	function getDelTemp(UserInfo, callback, error) {
		$.ajax({
			type: 'post',
			url : '/approver/del_temp',
			data : UserInfo,
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
	
	function selectTempApprover(TempInfo, callback, error) {
		$.ajax({
			type: 'post',
			url : '/approver/select_temp_approver',
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
		$.getJSON('/approver/check_temp?dept_id=' +dept_id,
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
			url : '/approver/del_temp',
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
	
	return{
		getTeamList:getTeamList,
		getDelTemp:getDelTemp,
		selectTempApprover:selectTempApprover,
		getTempManagerList:getTempManagerList,
		getDelManagerList:getDelManagerList
	};
})();
