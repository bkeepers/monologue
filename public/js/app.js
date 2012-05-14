jQuery(function($) {
  var statuses = new Monologue.Collection.Statuses();

  new Monologue.View.PostStatus({el: $('#new-status'), collection: statuses});
  new Monologue.View.StatusList({el: $('#statuses'), collection: statuses});
});