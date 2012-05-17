describe "Monologue.View.StatusList", ->
  beforeEach ->
    @$el = $("<div/>")
    @collection = new (Backbone.Collection.extend(url: "/mock"))
    spyOn @collection, "fetch"
    @view = new Monologue.View.StatusList
      el: @$el
      collection: @collection

  it "fetches records from the server", ->
    expect(@collection.fetch).toHaveBeenCalled()

  it "renders when collection is reset", ->
    @collection.reset [ text: "Unit testing is fun" ]
    expect(@$el).toContain("li")
    expect(@$el.find("li")).toHaveText("Unit testing is fun")

  it "appends newly added items", ->
    @collection.add text: 'Maybe not "fun", but at least useful'
    expect(@$el).toContain("li")
    expect(@$el.find("li")).toHaveText('Maybe not "fun", but at least useful')
