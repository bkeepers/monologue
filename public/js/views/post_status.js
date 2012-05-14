// View to manage posting a new status.
//
// Dependencies:
// * el - A form element with a textarea
// * collection - the collection that the status will be created in
Monologue.View.PostStatus = Backbone.View.extend({
  events: {
    "submit": "submit"
  },

  submit: function(e) {
    e.preventDefault();
    var $input = this.$el.find('textarea');
    this.collection.create({text: $input.val()});
    $input.val('');
    return false;
  }
});
