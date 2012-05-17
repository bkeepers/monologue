describe "Monologue.View.PostStatus", ->

  beforeEach ->
    @$el = $("<form><textarea>See, it's not so hard!</textarea></form>")
    # prevent collection from trying to sync with the server
    @collection = new (Backbone.Collection.extend(url: "/mock"))
    spyOn @collection, "create"
    @view = new Monologue.View.PostStatus
      el: @$el
      collection: @collection

  describe "submitting the form", ->
    it "creates status when submitting form", ->
      @$el.trigger "submit"
      expect(@collection.create).toHaveBeenCalledWith text: "See, it's not so hard!"

    it "clears the textarea", ->
      @$el.trigger "submit"
      expect(@$el.find("textarea").val()).toEqual ""