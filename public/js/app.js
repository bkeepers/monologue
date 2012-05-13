jQuery(function($) {
  var statuses = new Monologue.Collection.Statuses();

  $('form').on('submit', function() {
    statuses.create({text: $(this).find('textarea').val()});
    return false;
  });

  var append = function(status) {
    $('#statuses').append('<li>' + status.get('text') + '</li>');
  }

  statuses.on('reset', function() {
    this.each(append);
  });
  statuses.on('add', append);

  statuses.fetch();
});