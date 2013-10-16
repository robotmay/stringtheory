'use strict'

angular.module('stringtheoryApp')
  .controller 'StringsCtrl', ($scope, storage) ->
    # Defaults and startup
    defaultTemplate = [
      { key: "text", title: "Original Text", required: true },
      { key: "reading", title: "Reading/Pronunciation", required: false },
      { key: "translation", title: "Translation", required: false }
    ]

    storage.bind $scope, 'strings', { defaultValue: [] }
    storage.bind $scope, 'settings',
      defaultValue:
        template: defaultTemplate
        showSettings: false

    $scope.stringFields = []
    $scope.filteredStrings = []

    # Pagination
    $scope.currentPage = 1
    $scope.maxSize = 5
    $scope.perPage = 25

    $scope.$watch 'currentPage + perPage', ->
      start = ($scope.currentPage - 1) * $scope.perPage
      end = start + $scope.perPage
      console.log? [start, end]
      $scope.filteredStrings = $scope.strings.slice(start, end)

    # Utility to generate the new string template
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
      record = {}
      for field in $scope.stringFields
        record[field.key] = field.data
        field.data = ''

      $scope.strings.unshift(record)

    $scope.removeString = (index) ->
      $scope.strings.splice(index, 1)

    $scope.resetTemplate = ->
      $scope.settings.template = defaultTemplate
