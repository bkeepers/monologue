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
    return this.make('li', {className:'status'}, model.get('text'));
  }
});
