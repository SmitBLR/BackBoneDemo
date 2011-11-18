BackBoneDemo.Views.Employees ||= {}

class BackBoneDemo.Views.Employees.EmployeeView extends Backbone.View
  template: JST["backbone/templates/employees/employee"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    router.employees.remove(@model)
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this