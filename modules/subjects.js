angular.module('subjects-module',['bootstrap-modal']).factory('form', function($compile,$timeout,$http,bootstrapModal) {
	
	function form() {
		
		var loading = '<div class="col-sm-offset-4 col-sm-8"><button type="button" class="btn btn-inverse" title="Loading" disabled><i class="fa fa-spin fa-refresh"></i>&nbsp; Please wait...</button></div>';
		
		var self = this;
		
		self.data = function(scope) { // initialize data
		
			scope.subject = {};
			scope.subject.subject_id = 0;

			scope.subjects = []; // list			

		};

		function validate(scope) {
			
			var controls = scope.formHolder.subject.$$controls;
			
			angular.forEach(controls,function(elem,i) {
				
				if (elem.$$attr.$attr.required) elem.$touched = elem.$invalid;
									
			});

			return scope.formHolder.subject.$invalid;
			
		};

		self.subject = function(scope,row) {						
			
			scope.subject = {};
			scope.subject.subject_id = 0;

			$('#x_content').html(loading);
			$('#x_content').load('forms/subject.html',function() {
				$timeout(function() { $compile($('#x_content')[0])(scope); },100);				
			});
			
			if (row != null) {
				if (scope.$id > 2) scope = scope.$parent;				
				$http({
				  method: 'POST',
				  url: 'handlers/subject-edit.php',
				  data: {subject_id: row.subject_id}
				}).then(function mySucces(response) {
					
					angular.copy(response.data, scope.subject);
					
				}, function myError(response) {
					 
				  // error
					
				});					
			};					
			
		};
		
		self.save = function(scope) {	
			
			if (validate(scope)) return;
			
			$http({
			  method: 'POST',
			  url: 'handlers/subject-save.php',
			  data: {subject: scope.subject}
			}).then(function mySucces(response) {
				
				// self.list(scope);
				
			}, function myError(response) {
				 
			  // error
				
			});			
			
		};
		
		self.delete = function(scope,row) {
			
		var onOk = function() {
			
			if (scope.$id > 2) scope = scope.$parent;			
			
			$http({
			  method: 'POST',
			  url: 'handlers/subject-delete.php',
			  data: {subject_id: [row.subject_id]}
			}).then(function mySucces(response) {

				self.list(scope);
				
			}, function myError(response) {
				 
			  // error
				
			});

		};

		bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this record?',onOk,function() {});			
			
		};
		
		self.list = function(scope) {

			scope.subject = {};
			scope.subject.subject_id = 0;			
			$http({
			  method: 'POST',
			  url: 'handlers/subject-list.php',
			}).then(function mySucces(response) {
				
				scope.subjects = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});
			
			$('#x_content').html(loading);
			$('#x_content').load('lists/subjects.html', function() {
				$timeout(function() { $compile($('#x_content')[0])(scope); },100);								
				// instantiate datable
				$timeout(function() {
					$('#subject').DataTable({
						"ordering": false
					});	
				},200);
				
			});					
			
		};
		
	};
	
	return new form();
	
});