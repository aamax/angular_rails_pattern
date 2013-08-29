@MyObjectCtrl = ($scope, $resource, myObjectResource) ->
  myObjectList = myObjectResource.loadMyObjects()

  $scope.initializeMyObject = ->
    myObject = {name: '', description: ''}
    myObject

  $scope.$on "myObjectLoaded", ->
    $scope.myObjectList = myObjectResource.getMyObjects()

  $scope.deleteMyObject = (obj) ->
    $scope.myObject = obj
    $scope.myObject.$delete()

    idx = $scope.myObjectList.indexOf(obj)
    $scope.myObjectList.splice(idx, 1)
    $scope.myObject = $scope.myObjectList[0]

  $scope.showMyObject = (obj) ->
    if typeof obj == 'object'
      $.each $scope.myObjectList, (index, obj) ->
        if obj.id == obj.id
          obj = obj
    myObjectResource.setCurrentMyObject(obj)
    isShow = false # can set to true to not allow editting
    myObjectResource.setIsShowForm(isShow)
    $scope.toggleModal("show")

  $scope.toggleModal = (action = "toggle") ->
    angular.element('#editMyObjectModal').modal(action)

  $scope.newMyObject = () ->
	  myObjectResource.setCurrentMyObject($scope.initializeMyObject())
	  myObjectResource.setIsShowForm(false)
	  $scope.toggleModal("show")

  $scope.$on "myObjectUpdate", ->
    obj = myObjectResource.getCurrentMyObject()
    $scope.current_my_object = obj
    if obj.id
      obj.$update((data) ->
        if $scope.current_my_object.id == data.id
          $scope.current_my_object = data
      )
    else
      # handle new object
      objR = myObjectResource.getNewMyObjectResource()
      objR.$save(obj, (data) ->
        $scope.myObjectList.push(data)
      )

