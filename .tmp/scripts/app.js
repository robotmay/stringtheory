(function() {
  'use strict';
  angular.module('stringtheoryApp', ['angularLocalStorage']).config(function($routeProvider) {
    return $routeProvider.when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    }).when('/strings', {
      templateUrl: 'views/strings.html',
      controller: 'StringsCtrl'
    }).otherwise({
      redirectTo: '/'
    });
  });

}).call(this);

/*
//@ sourceMappingURL=app.js.map
*/