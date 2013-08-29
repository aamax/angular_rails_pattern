@MyObjectModalCtrl = ($scope, $resource, myObjectResource) ->
  $scope.myObject = myObjectResource.getCurrentMyObject()
  $scope.showForm = true

  $scope.setupMyObject = () ->
    $scope.myObject = myObjectResource.getCurrentMyObject()
    $scope.showForm = myObjectResource.getIsShowForm()
    ""

  $scope.dismiss = (flag) ->
    if flag == 'cancel'
      $scope.toggleModal('hide')
    else
      myObjectResource.setCurrentMyObject($scope.myObject)
      $scope.$parent.$broadcast "myObjectUpdate"
      $scope.toggleModal('hide')