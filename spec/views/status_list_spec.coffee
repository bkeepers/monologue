describe "Monologue.View.StatusList", ->
  Given -> @$el = $("<div/>")
  Given -> @collection = new (Backbone.Collection.extend(url: "/mock"))
  Given -> spyOn(@collection, "fetch")
  Given -> @view = new Monologue.View.StatusList
    el: @$el
    collection: @collection

  Then -> expect(@collection.fetch).toHaveBeenCalled()

  describe "~ binding to collection events", ->
    context "collection fires reset", ->
      When -> @collection.reset [ text: "Unit testing is fun" ]
      Then -> expect(@$el).toContain("li")
      Then -> expect(@$el.find("li")).toHaveText("Unit testing is fun")

    context "collection fires add", ->
      When -> @collection.add text: 'Maybe not "fun", but at least useful'
      Then -> expect(@$el).toContain("li")
      Then -> expect(@$el.find("li")).toHaveText('Maybe not "fun", but at least useful')
