console.log("Add Modify User Module............");
var AddModifyService={};

var AddModifyService = (function() {
	
	function getHeadList(head ,callback, error) {
		
		$.getJSON('/admin/check_head?head=' +head,
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
		
		$.getJSON('/admin/check_depart?depart=' +depart,
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
		
		$.getJSON('/admin/check_team?team=' +team,
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
	
	function addUser(userInfo, callback, error) { 
		
		$.ajax({
			type: 'post',
			url: '/admin/add_user',
			data : userInfo,
			async: false,
			success: function(result, status, xhr) {
				if(callback) {callback(result);}
			},
			error : function(xhr, status, er){
				if(error) {error(er);}
			}
		})
	}
	function modify(modInfo, callback, error) {
		$.ajax({
			type: 'post',
			url : '/admin/mod_user',
			data : modInfo,
			async: false,
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
		getDepartList:getDepartList,
		getHeadList:getHeadList,
		addUser:addUser,
		modify:modify
	};
})();
