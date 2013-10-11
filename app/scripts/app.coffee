'use strict'

angular.module('stringtheoryApp', ['angularLocalStorage'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/strings',
        templateUrl: 'views/strings.html',
        controller: 'StringsCtrl'
      .otherwise
        redirectTo: '/'
