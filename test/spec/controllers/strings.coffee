'use strict'

describe 'Controller: StringsCtrl', () ->

  # load the controller's module
  beforeEach module 'stringtheoryApp', 'angularLocalStorage'

  StringsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StringsCtrl = $controller 'StringsCtrl', {
      $scope: scope
    }

  it 'sets a default array of strings', ->
    assert.deepEqual(scope.strings, [])
