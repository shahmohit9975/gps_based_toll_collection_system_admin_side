/* ==============================================
            Custombox
 =============================================== */
$(function () {
    $('[data-plugin="custommodal"]').on('click', function(e) {
        Custombox.open({
            target: $(this).attr("href"),
            effect: $(this).attr("data-animation"),
            overlaySpeed: $(this).attr("data-overlaySpeed"),
            overlayColor: $(this).attr("data-overlayColor")
        });
        e.preventDefault();
    });
});