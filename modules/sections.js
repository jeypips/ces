angular.module('sections-module',['bootstrap-modal']).factory('form', function($compile,$timeout,$http,bootstrapModal) {
	
	function form() {
		
		var loading = '<div class="col-sm-offset-4 col-sm-8"><button type="button" class="btn btn-inverse" title="Loading" disabled><i class="fa fa-spin fa-refresh"></i>&nbsp; Please wait...</button></div>';
		
		var self = this;
		
		self.data = function(scope) { // initialize data
		
			scope.section = {};
			scope.section.section_id = 0;

			scope.sections = []; // list			

		};

		function validate(scope) {
			
			var controls = scope.formHolder.section.$$controls;
			
			angular.forEach(controls,function(elem,i) {
				
				if (elem.$$attr.$attr.required) elem.$touched = elem.$invalid;
									
			});

			return scope.formHolder.section.$invalid;
			
		};

		self.section = function(scope,row) {						
			
			scope.section = {};
			scope.section.section_id = 0;

			$('#x_content').html(loading);
			$('#x_content').load('forms/section.html',function() {
				$timeout(function() { $compile($('#x_content')[0])(scope); },100);				
			});
			
			if (row != null) {
				if (scope.$id > 2) scope = scope.$parent;				
				$http({
				  method: 'POST',
				  url: 'handlers/section-edit.php',
				  data: {section_id: row.section_id}
				}).then(function mySucces(response) {
					
					angular.copy(response.data, scope.section);
					
				}, function myError(response) {
					 
				  // error
					
				});					
			};					
			
		};
		
		self.save = function(scope) {	
			
			if (validate(scope)) return;
			
			$http({
			  method: 'POST',
			  url: 'handlers/section-save.php',
			  data: {section: scope.section}
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
			  data: {section_id: [row.section_id]}
			}).then(function mySucces(response) {

				self.list(scope);
				
			}, function myError(response) {
				 
			  // error
				
			});

		};

		bootstrapModal.confirm(scope,'Confirmation','Are you sure you want to delete this record?',onOk,function() {});			
			
		};
		
		self.list = function(scope) {

			scope.section = {};
			scope.section.section_id = 0;			
			$http({
			  method: 'POST',
			  url: 'handlers/section-list.php',
			}).then(function mySucces(response) {
				
				scope.sections = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});
			
			$('#x_content').html(loading);
			$('#x_content').load('lists/sections.html', function() {
				$timeout(function() { $compile($('#x_content')[0])(scope); },100);								
				// instantiate datable
				$timeout(function() {
					$('#section').DataTable({
						"ordering": false
					});	
				},200);
				
			});					
			
		};
		
	};
	
	return new form();
	
});