function initMap() {
  var framgia = { lat: 21.0168864, lng: 105.7855574 };
  var map = new google.maps.Map(document.getElementById("map"), {
    center: framgia,
    zoom: 15
  });
  var marker = new google.maps.Marker({ position: framgia, map: map });
}
