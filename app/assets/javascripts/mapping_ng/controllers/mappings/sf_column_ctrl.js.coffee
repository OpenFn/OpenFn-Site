'use strict'

@controllerModule.controller 'SfColumnCtrl', ['$scope', '$filter', 'SalesforceObject', 'SalesforceObjectField', 'SalesforceService',
  ($scope, $filter, SalesforceObject, SalesforceObjectField, SalesforceService) ->

    ########## VARIABLE ASSIGNMENT

    ########## FUNCTIONS

    $scope.filterSfFields = (event, ui) ->

      sfObject = $scope.mapping.mappedSfObjects.filter((sfObj) -> sfObj.name is ui.item.sortable.moved.object_name)[0]

      if $scope.sfFilter
        sfObject.fields = $filter('filter')(sfObject.originalFields, $scope.sfFilter)
      else
        sfObject.fields = angular.copy(sfObject.originalFields)

    $scope.prepare = ->
      $scope.sfSortableOptions =
        connectWith: '.sf-connected-sortable'
        revert: true
        opacity: 0.8
        scroll: true
        stop: (event, ui) ->
          #$scope.filterSfFields(event, ui)

    ########## WATCHES

    $scope.$watch "mapping.salesforceObjectName", (salesforceObjectId) ->
      if salesforceObjectId isnt undefined && salesforceObjectId isnt ''
        SalesforceObject.save(
          mapping_id: $scope.mapping.id
          salesforce_object:
            name: salesforceObjectId,
        ).$promise.then (response) ->
          $scope.mapping.salesforceObjects.push(response.salesforce_object)

          # Reset the chosen object name
          $scope.mapping.salesforceObjectName = ''


    ########## BEFORE FILTERS

    $scope.prepare()
]
