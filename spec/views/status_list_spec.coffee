describe "Monologue.View.StatusList", ->
  Given -> @collection = new Backbone.Collection
  Given -> spyOn(@collection, "fetch")
  Given -> @view = new Monologue.View.StatusList
    collection: @collection

  Then -> expect(@collection.fetch).toHaveBeenCalled()

  describe "~ binding to collection events", ->
    context "collection fires reset", ->
      When -> @collection.reset [ text: "Unit testing is fun" ]
      Then -> expect(@view.$el).toContain("li")
      Then -> expect(@view.$el.find("li")).toHaveText("Unit testing is fun")

    context "collection fires add", ->
      When -> @collection.add text: 'Maybe not "fun", but at least useful'
      Then -> expect(@view.$el).toContain("li")
      Then -> expect(@view.$el.find("li")).toHaveText('Maybe not "fun", but at least useful')
