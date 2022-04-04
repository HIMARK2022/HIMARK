console.log("Add Modify User Module............");
var AddModifyService={};

var AddModifyService = (function() {
	
	function getHeadList(head ,callback, error) {
		console.log("전달받는 값"+head)
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
		console.log("전달받는 값"+depart)
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
		console.log("전달받는 값"+team)
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
	
	function addUser(userInfo, callback, error) { //ajax처리 후 동작해야 하는 함수
		console.log("add upperCategory.........");
		//ajax로 replyController초풀
		$.ajax({
			type: 'post',
			url: '/admin/add_user',
			data : userInfo,
			
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
