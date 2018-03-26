/**
 * Add the class "confirmer" to an anchor. User has to confirm deletion
 */
$('body').on('click', '.confirmer', function (e) {
    e.preventDefault();
    var self = this;
    var url = $(this).attr('href');
    var removeDom = $(this).data('confirm-remove');
    var message = $(this).data('confirm-message');
    var title = $(this).data('confirm-title') || 'Confirm';
    var content = $(this).data('confirm-content') || 'Continue?';
    var confirmButton = $(this).data('confirm-submit') || 'Delete';
    var cancelButton = $(this).data('confirm-cancel') || 'Cancel';
    var buttonClass = $(this).data('confirm-submitCls') || 'btn-danger';

    $.confirm({
        title: title,
        content: content,
        confirmButton: confirmButton,
        cancelButton: cancelButton,
        confirmButtonClass: buttonClass,
        confirm: function () {
            document.location.href = url;
        },
        cancel: function () {
            //
        }
    });


});