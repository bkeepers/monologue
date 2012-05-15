// View to manage rendering of statuses
//
// Responsibility:
// * Display list of statuses
//
// Dependencies:
// * el - Element to contain the rendered statuses
// * collection - a collection of statuses
Monologue.View.StatusList = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'render', 'add');
    this.collection.on('reset', this.render);
    this.collection.on('add',   this.add);
    this.collection.fetch();
  },

  render: function() {
    this.collection.each(_.bind(this.add, this));
  },

  add: function(model) {
    this.$el.append(this.template(model))
  },

  template: function(model) {
    return this.make('li', {'class':'status'}, model.get('text'));
  }
});
