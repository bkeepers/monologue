describe "Monologue.View.PostStatus", ->
  Given -> @collection = {}
  Given -> @view = new Monologue.View.PostStatus
    collection: @collection

  Then -> expect(@view.events).toEqual
    "submit": "submit"

  describe "#submit", ->
    Given -> @e = preventDefault: jasmine.createSpy()
    Given -> @collection.create = jasmine.createSpy()
    Given -> @view.$el.affix('textarea').val("See, it's not so hard!")
    When -> @view.submit(@e)
    Then -> expect(@e.preventDefault).toHaveBeenCalled()
    Then -> expect(@collection.create).toHaveBeenCalledWith text: "See, it's not so hard!"
    Then -> expect(@view.$("textarea")).toHaveValue("")
