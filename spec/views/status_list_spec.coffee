describe "Monologue.View.StatusList", ->
  Given -> @collection = new Backbone.Collection
  Given -> spyOn(@collection, "on")
  Given -> spyOn(@collection, "fetch")

  Given -> @subject = new Monologue.View.StatusList
    collection: @collection

  describe "#initialize", ->
    Then -> expect(@collection.on).toHaveBeenCalledWith('reset', @subject.render)
    Then -> expect(@collection.on).toHaveBeenCalledWith('add', @subject.add)
    Then -> expect(@collection.fetch).toHaveBeenCalled()

  describe "#render", ->
    Given -> @collection.add(text: "Unit testing is fun")
    When -> @subject.render()
    Then -> expect(@subject.$("li.status")).toHaveText("Unit testing is fun")

  describe "#add", ->
    Given -> @model = new Backbone.Model(text: 'Maybe not "fun", but at least useful')
    When -> @subject.add(@model)
    Then -> expect(@subject.$("li.status")).toHaveText('Maybe not "fun", but at least useful')

    context "adding another model", ->
      Given -> @anotherModel = new Backbone.Model(text: 'Nope, totally fun')
      When -> @subject.add(@anotherModel)
      Then -> @subject.$("li").length == 2
      Then -> expect(@subject.$("li.status:last")).toHaveText('Nope, totally fun')