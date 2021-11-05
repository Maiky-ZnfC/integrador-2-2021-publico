let app = angular.module('loginApp', ['ngRoute']);
app.config(function($routeProvider) {
	$routeProvider
		.when('/ingreso', {
			templateUrl: 'ingreso.html',
			controller : ''
		})
		.when('/seleccionar_usuario', {
			templateUrl: 'seleccionar_usuario.html'
		})
		.when('/registro_consumidor', {
			templateUrl: 'registro_consumidor.html'
		})
		.when('/registro_vendedor', {
			templateUrl: 'registro_vendedor.html'
		});
});
app.controller('myCtrl', function($scope) {
	$scope;
});