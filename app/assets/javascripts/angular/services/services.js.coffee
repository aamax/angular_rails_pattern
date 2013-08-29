angular.module("my_objects", ["ngResource",
                        "ng-rails-csrf",
                        "MyObjectServices"])

angular.module("MyObjectServices", []).factory "myObjectResource", ($resource, $rootScope) ->
  _loadedMyObjects    = []
  _currMyObject = undefined
  _isShowForm = true
  _myObjects = $resource('/my_objects/:id', {id: '@id'}, {update: {method: 'put'}})

  loadMyObjects: ->
    _loadedMyObjects = _myObjects.query( ->
      $rootScope.$broadcast "myObjectLoaded"
    )

  getMyObjects: ->
    _loadedMyObjects.slice()

  getIsShowForm: ->
    _isShowForm

  setIsShowForm: (value) ->
    _isShowForm = value

  getCurrentMyObject: ->
    _currMyObject

  setCurrentMyObject: (obj) ->
    _currMyObject = obj

  getNewMyObjectResource: ->
    obj = new _myObjects()
    obj

