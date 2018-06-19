function showReservationForm(reservation) {
    var date = reservation.getAttribute("data-date-type");
    var block = reservation.getAttribute("data-block-type");
    document.getElementById("reservation_date").value = date;
    document.getElementById("reservation_from_block").value = block;
    document.getElementById("reservation_to_block").value = block;
    $("#reservationForm").show();
}

function hideReservationForm() {
    $("#reservationForm").hide();
}

$( document ).on('turbolinks:load', function() {
    $("#reservationForm").hide();
});