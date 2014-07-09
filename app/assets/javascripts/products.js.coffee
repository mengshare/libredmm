app = angular.module('libredmm', ["ui.bootstrap"])

app.controller(
  'ActressTypeaheadCtrl',
  [
    '$scope',
    '$http',
    ($scope, $http) ->
      $scope.selected = $('#actress')[0].value
      $http.get('/api/actresses.json').then(
        (response) ->
          $scope.actresses = response.data
      )
  ]
)

app.controller(
  'CodeTypeaheadCtrl',
  [
    '$scope',
    '$http',
    ($scope, $http) ->
      $scope.selected = $('#code')[0].value
      $http.get('/api/codes.json').then(
        (response) ->
          $scope.codes = response.data
      )
  ]
)

app.controller(
  'GenreTypeaheadCtrl',
  [
    '$scope',
    '$http',
    ($scope, $http) ->
      $scope.selected = $('#genre')[0].value
      $http.get('/api/genres.json').then(
        (response) ->
          $scope.genres = response.data
      )
  ]
)

app.controller(
  'MakerTypeaheadCtrl',
  [
    '$scope',
    '$http',
    ($scope, $http) ->
      $scope.selected = $('#maker')[0].value
      $http.get('/api/makers.json').then(
        (response) ->
          $scope.makers = response.data
      )
  ]
)

app.controller(
  'TitleTypeaheadCtrl',
  [
    '$scope',
    '$http',
    ($scope, $http) ->
      $scope.selected = $('#title')[0].value
      $http.get('/api/titles.json').then(
        (response) ->
          $scope.titles = response.data
      )
  ]
)
