class BackBoneDemo.Routers.EmployeesRouter extends Backbone.Router
  initialize: (options) ->
    @employees = new BackBoneDemo.Collections.EmployeesCollection()
    @employees.reset options.employees

  routes:
    "/index"    : "index"
    ".*"        : "index"

  index: ->
    @view = new BackBoneDemo.Views.Employees.IndexView(employees: @employees)
    @add_view = new BackBoneDemo.Views.Employees.NewView(collection: @employees)
    $("#employees").html(@view.render().el)
    $("#add_div").html(@add_view.render().el)
