(function() {
  'use strict';
  angular.module('stringtheoryApp').controller('StringsCtrl', function($scope, storage) {
    storage.bind($scope, 'strings', {
      defaultValue: []
    });
    $scope.addString = function() {
      $scope.strings.unshift({
        text: $scope.string.text,
        translation: $scope.string.translation
      });
      $scope.string.text = '';
      return $scope.string.translation = '';
    };
    return $scope.removeString = function(index) {
      return $scope.strings.splice(index, 1);
    };
  });

}).call(this);

/*
//@ sourceMappingURL=strings.js.map
*/