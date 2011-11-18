BackBoneDemo.Views.Employees ||= {}

class BackBoneDemo.Views.Employees.NewView extends Backbone.View    
  template: JST["backbone/templates/employees/new"]
  
  events:
    "submit #new-employee": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    console.log(@model.toJSON())
    @model.set({student: document.getElementById("student").checked})
    e.stopPropagation()
    e.preventDefault()
    if (notify(@model, @model.validator(@model.toJSON())))
      $("#errors").html("");
      @model.unset("errors")
      @collection.create(@model.toJSON(),
        success: =>
          router.index()
        error: (employee, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this