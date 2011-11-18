class BackBoneDemo.Models.Employee extends Backbone.Model
  paramRoot: 'employee'

  defaults:
    name: null
    age: null
    nickname: null
    student: null

  validator: (attrs) ->
    errors = {}
    if (not attrs.age) or (attrs.age < 18) or (attrs.age > 65)
      errors.age = "Invalid age"
    if _.isEmpty(attrs.name)
      errors.name = "Name can't be blank"
    errors

class BackBoneDemo.Collections.EmployeesCollection extends Backbone.Collection
  model: BackBoneDemo.Models.Employee
  url: '/employees'