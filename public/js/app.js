jQuery(function($) {
  var statuses = new Monologue.Collection.Statuses();

  new Monologue.View.PostStatus({el: $('#new-status'), collection: statuses});

  var append = function(status) {
    $('#statuses').append('<li>' + status.get('text') + '</li>');
  }

  statuses.on('reset', function() {
    this.each(append);
  });
  statuses.on('add', append);

  statuses.fetch();
});