'use strict'

angular.module('stringtheoryApp')
  .controller 'StringsCtrl', ($scope, storage) ->
    storage.bind($scope, 'strings', { defaultValue: [] })

    $scope.addString = ->
      $scope.strings.unshift {
        text: $scope.string.text,
        translation: $scope.string.translation
      }

      $scope.stringText = ''
