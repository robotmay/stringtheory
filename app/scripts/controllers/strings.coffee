'use strict'

angular.module('stringtheoryApp')
  .controller 'StringsCtrl', ($scope, storage) ->
    # Defaults and startup
    defaultTemplate = [
      { key: "text", title: "Original Text", required: true },
      { key: "translation", title: "Translation", required: false }
    ]

    storage.bind $scope, 'strings', { defaultValue: [] }
    storage.bind $scope, 'settings', { defaultValue: { template: defaultTemplate } }

    $scope.stringFields = []

    $scope.calculateStringFields = ->
      $scope.stringFields = []
      for field in $scope.settings.template
        field = angular.copy(field)
        field.data = ""
        $scope.stringFields.push field

    $scope.calculateStringFields()

    # Watch for settings changes
    $scope.$watch 'settings', (oldSettings, newSettings) ->
      console.log "Settings changed"
      $scope.calculateStringFields()

    $scope.addString = ->
      console.log $scope.stringFields
      record = {}
      for field in $scope.stringFields
        record[field.key] = field.data
        field.data = ''

      $scope.strings.unshift(record)

    $scope.removeString = (index) ->
      $scope.strings.splice(index, 1)

    $scope.resetTemplate = ->
      $scope.settings.template = defaultTemplate

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

