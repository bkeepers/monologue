require('/js/views/post_status.js');

describe("Monologue.View.PostStatus", function() {
  var view, $el, collection, input, mockEvent;

  beforeEach(function() {
   $el = $("<form><textarea>See, it's not so hard!</textarea></form>");
   collection = new (Backbone.Collection.extend({url: '/mock'}));
   // prevent collection from trying to sync with the server
   spyOn(collection, 'create');

   view = new Monologue.View.PostStatus({el: $el, collection: collection});
  });

  describe("events", function() {
    it("binds 'submit' to 'submit'", function() {
      expect(view.events['submit']).toBe("submit");
    });
  });

  describe("submitting the form", function() {
    beforeEach(function() {
      input = document.createElement('input');
      input.value = "See, it's not so hard!";

      mockEvent = {
        preventDefault: function() {},
        currentTarget: input
      }

      spyOn(mockEvent, 'preventDefault');
    });

    it("delegates create to collection", function() {
      view.submit(mockEvent);
      expect(collection.create).toHaveBeenCalledWith({text: "See, it's not so hard!"});
    });

    it("prevents default event actions", function() {
      view.submit(mockEvent);

      expect(mockEvent.preventDefault).toHaveBeenCalled();
    });

   it("clears the textarea", function() {
     $el.trigger('submit');
     expect($el.find('textarea').val()).toEqual('');
   });
  });
});
