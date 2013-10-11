(function() {
  'use strict';
  describe('Controller: StringsCtrl', function() {
    var StringsCtrl, scope;
    beforeEach(module('stringtheoryApp'));
    StringsCtrl = {};
    scope = {};
    beforeEach(inject(function($controller, $rootScope) {
      scope = $rootScope.$new();
      return StringsCtrl = $controller('StringsCtrl', {
        $scope: scope
      });
    }));
    return it('should attach a list of awesomeThings to the scope', function() {
      return expect(scope.awesomeThings.length).toBe(3);
    });
  });

}).call(this);

/*
//@ sourceMappingURL=strings.js.map
*/