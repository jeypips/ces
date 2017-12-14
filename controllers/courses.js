var app = angular.module('courses',['toggle-fullscreen','account-module','courses-module']);

app.controller('coursesCtrl',function($scope,fullscreen,form) {
	
	$scope.views = {};

	$scope.fullscreen =  fullscreen;
	
	form.data($scope);
	form.list($scope);
	
	$scope.form = form;

});