uri_params = ->
  params = {}
  for token in location.search.substring(1).split('&')
    pair = token.split('=')
    params[pair[0]] = pair[1]
  params

window.uri_params = uri_params

hide_search_box = ->
  params = uri_params()
  for k, v of params
    if !!v && k not in ['commit', 'page', 'q', 'text_mode', 'utf8']
      return
  $('#advanced_search_box').collapse('hide')

$(document).on('ready page:change', hide_search_box)

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
