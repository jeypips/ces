var app = angular.module('subjects',['toggle-fullscreen','account-module','subjects-module']);

app.controller('subjectsCtrl',function($scope,fullscreen,form) {
	
	$scope.formHolder = {};
	$scope.views = {};
	
	$scope.fullscreen =  fullscreen;
	
	form.data($scope);
	form.list($scope);
	
	$scope.form = form;

});