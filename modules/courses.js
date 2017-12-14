angular.module('courses-module',['bootstrap-modal']).factory('form', function($compile,$timeout,$http,bootstrapModal) {
	
	function form() {
		
		var loading = '<div class="col-sm-offset-4 col-sm-8"><button type="button" class="btn btn-inverse" title="Loading" disabled><i class="fa fa-spin fa-refresh"></i>&nbsp; Please wait...</button></div>';
		
		var self = this;
		
		self.data = function(scope) { // initialize data

			scope.formHolder = {};		

			scope.course = {};
			scope.course.course_id = 0;

			scope.courses = []; // list			

		};

		function validate(scope) {
			
			var controls = scope.formHolder.course.$$controls;
			
			angular.forEach(controls,function(elem,i) {
				
				if (elem.$$attr.$attr.required) elem.$touched = elem.$invalid;
									
			});

			return scope.formHolder.course.$invalid;
			
		};

		self.course = function(scope,row) {						
			
			scope.course = {};
			scope.course.course_id = 0;

			$('#x_content').html('Loading...');
			$('#x_content').load('forms/course.html',function() {
				$timeout(function() { $compile($('#x_content')[0])(scope); },100);				
			});
			
			if (row != null) {
				if (scope.$id > 2) scope = scope.$parent;				
				$http({
				  method: 'POST',
				  url: 'handlers/course-edit.php',
				  data: {course_id: row.course_id}
				}).then(function mySucces(response) {
					
					angular.copy(response.data, scope.course);
					
				}, function myError(response) {
					 
				  // error
					
				});					
			};					
			
		};
		
		self.save = function(scope) {	
			
			if (validate(scope)) return;
			
			$http({
			  method: 'POST',
			  url: 'handlers/course-save.php',
			  data: {course: scope.course}
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
			  url: 'handlers/course-delete.php',
			  data: {course_id: [row.course_id]}
			}).then(function mySucces(response) {

				self.list(scope);
				
			}, function myError(response) {
				 
			  // error
				
			});

		};

		bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this record?',onOk,function() {});			
			
		};
		
		self.list = function(scope) {

			scope.course = {};
			scope.course.course_id = 0;			
			$http({
			  method: 'POST',
			  url: 'handlers/course-list.php',
			}).then(function mySucces(response) {
				
				scope.courses = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});
			
			$('#x_content').html(loading);
			$('#x_content').load('lists/courses.html', function() {
				$timeout(function() { $compile($('#x_content')[0])(scope); },100);								
				// instantiate datable
				$timeout(function() {
					$('#course').DataTable({
						"ordering": false
					});	
				},200);
				
			});		
							
			
		};
		
	};
	
	return new form();
	
});