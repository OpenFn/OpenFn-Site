@controllerModule.controller 'CasesController', ['$scope', '$location', '$http', '$routeParams', '$timeout', ($scope, $location, $http, $routeParams, $timeout) ->
  $http.get('/case_studies/get_all').success((data) ->
    $scope.cases = data;
  )
]