console.log("Category Module............");
var categoryService={};

var categoryService = (function() {
	function addUpper(category, callback, error) { //ajax처리 후 동작해야 하는 함수
		console.log("add upperCategory.........");
		//ajax로 replyController초풀
		$.ajax({
			type: 'post',
			url: '/admin/approve_upperlist_add',
			data : {classify_name:category},
			success: function(result, status, xhr) {
				if(callback) {callback(result);}
			},
			error : function(xhr, status, er){
				if(error) {error(er);}
			}
		})
	}//addUpper
	
	function add(category, callback, error) { //ajax처리 후 동작해야 하는 함수
		console.log("add upperCategory.........");
		//ajax로 replyController초풀
		$.ajax({
			type: 'post',
			url: '/admin/approve_list_add',
			data : category,
			
			success: function(result, status, xhr) {
				if(callback) {callback(result);}
			},
			error : function(xhr, status, er){
				if(error) {error(er);}
			}
		})
	}//add
	
	function getUpperList(callback, error) {
				
		$.getJSON("/admin/uppercategory" + ".json",
			function(data) {
				if(callback) {
					callback(data); // 댓글 목록만 가져오는 경우
					//callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}//getUpperList
	
	function getList(upper_classify_name,callback, error) {
				console.log(upper_classify_name);
		$.getJSON("/admin/category?upper_classify_name=" +upper_classify_name,
			function(data) {
				if(callback) {
					console.log("하위분류리스트 : "+data);
					callback(data); // 댓글 목록만 가져오는 경우
					//callback( data.list); // 댓글 숫자와 목록을 가져오는 경우
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}//getList
	
	function remove(classify_name, callback, error){
		$.ajax( {
			type: 'delete',
			url : '/admin/approve_list_del/' + classify_name,
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
	}//remove
	
	function modify(category, callback, error) {
	console.log(category.mod_name);
	
		$.ajax({
			type: 'put',
			url : '/admin/approve_list_mod/'+ category.mod_name +"/" + category.mod_period,
			data : JSON.stringify(category),
			contentType : "application/json;charset=UTF-8",
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
	}//update
	
	
	return{
		addUpper:addUpper,
		add:add,
		getList:getList,
		getUpperList:getUpperList,
		remove:remove,
		modify:modify
	};
})();