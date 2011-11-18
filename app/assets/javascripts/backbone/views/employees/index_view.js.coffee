BackBoneDemo.Views.Employees ||= {}

class BackBoneDemo.Views.Employees.IndexView extends Backbone.View
  template: JST["backbone/templates/employees/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.employees.bind('reset', @addAll)
   
  addAll: () ->
    @options.employees.each(@addOne)
  
  addOne: (employee) ->
    view = new BackBoneDemo.Views.Employees.EmployeeView({model : employee})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(employees: @options.employees.toJSON() ))
    @addAll()
    
    return this