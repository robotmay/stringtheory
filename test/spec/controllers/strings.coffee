'use strict'

describe 'Controller: StringsCtrl', () ->

  # load the controller's module
  beforeEach module 'stringtheoryApp'

  StringsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    StringsCtrl = $controller 'StringsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
