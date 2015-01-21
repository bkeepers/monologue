function addStatus(options) {
    var text = options.text;
    $.ajax({
        url: '/statuses',
        type: 'POST',
        dataType: 'json',
        data: {text: text},
        success: options.success
    });
}
jQuery(function ($) {
    $('form').on('submit', function (event) {
        event.preventDefault();
        addStatus({
            text: $(event.target).find("textarea").val(),
            success: function (data) {
                $('#statuses').append('<li>' + data.text + '</li>');
            }
        });
    });

    $.ajax({
        url: '/statuses',
        dataType: 'json',
        success: function (data) {
            var $statuses = $('#statuses');
            for (var i = 0; data.length > i; i++) {
                $statuses.append('<li>' + data[i].text + '</li>');
            }
        }
    })
});