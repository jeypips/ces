var app = angular.module('sections',['toggle-fullscreen','account-module','sections-module']);

app.controller('sectionsCtrl',function($scope,fullscreen,form) {
	
	$scope.views = {};

	$scope.fullscreen =  fullscreen;
	
	form.data($scope);
	form.list($scope);
	
	$scope.form = form;

});