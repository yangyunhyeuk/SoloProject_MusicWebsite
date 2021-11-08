window.onload = function() {
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.26655931601729, 126.99943988430962), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도에 표시될 객체를 가지고 있을 배열입니다
    const locations = [
        {place: "hometown", lat: 37.26655931601729, lng: 126.99943988430962}
    ];

    for (var i = 0; i < locations.length; i++) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(locations[i].lat, locations[i].lng)
        });
    }
}