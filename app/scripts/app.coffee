'use strict'

angular.module('stringtheoryApp', ['angularLocalStorage', 'ui.bootstrap'])
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

  .directive 'json', ->
    {
      restrict: 'A', # only activate on element attribute
      require: 'ngModel', # get a hold of NgModelController
      link: (scope, element, attrs, ngModelCtrl) ->
        fromUser = (text) ->
          # Beware: trim() is not available in old browsers
          if !text or text.trim() is ''
            {}
          else
            # TODO catch SyntaxError, and set validation error..
            angular.fromJson(text)

        toUser = (object) ->
          # better than JSON.stringify(), because it formats + filters $$hashKey etc.
          angular.toJson(object, true)
        
        # push() if faster than unshift(), and avail. in IE8 and earlier (unshift isn't)
        ngModelCtrl.$parsers.push(fromUser)
        ngModelCtrl.$formatters.push(toUser)
        
        # $watch(attrs.ngModel) wouldn't work if this directive created a new scope;
        # see http://stackoverflow.com/questions/14693052/watch-ngmodel-from-inside-directive-using-isolate-scope how to do it then
        scope.$watch(attrs.ngModel, (newValue, oldValue) ->
          if newValue isnt oldValue
            ngModelCtrl.$setViewValue toUser(newValue)
            # TODO avoid this causing the focus of the input to be lost..
            ngModelCtrl.$render()
        , true); # MUST use objectEquality (true) here, for some reason..
    }

