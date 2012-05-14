require('/js/views/post_status.js');

describe("Monologue.View.PostStatus", function() {
  var view, $el, collection;

  beforeEach(function() {
    $el = $("<form><textarea>See, it's not so hard!</textarea></form>");
    collection = new (Backbone.Collection.extend({url: '/mock'}));
    // prevent collection from trying to sync with the server
    spyOn(collection, 'create');

    view = new Monologue.View.PostStatus({el: $el, collection: collection});
  });

  describe("submitting the form", function() {
    it("creates status when submitting form", function() {
      $el.trigger('submit');
      expect(collection.create).toHaveBeenCalledWith({text: "See, it's not so hard!"});
    });

    it("clears the textarea", function() {
      $el.trigger('submit');
      expect($el.find('textarea').val()).toEqual('');
    });
  });
});