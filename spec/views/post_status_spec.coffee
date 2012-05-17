describe "Monologue.View.PostStatus", ->
  Given -> @$el = $("<form><textarea>See, it's not so hard!</textarea></form>")
  Given -> @collection = new (Backbone.Collection.extend(url: "/mock"))
  Given -> spyOn(@collection, "create")
  Given -> @view = new Monologue.View.PostStatus
    el: @$el
    collection: @collection

  describe "~ binding to user events", ->
    context "form fires submit", ->
      When -> @$el.trigger("submit")
      Then -> expect(@collection.create).toHaveBeenCalledWith text: "See, it's not so hard!"
      Then -> expect(@$el.find("textarea")).toHaveValue("")
