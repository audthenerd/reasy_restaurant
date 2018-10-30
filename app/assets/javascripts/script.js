// document.querySelector('#mainsubmit').addEventListener('click', submitall);

// function submitall(){
//     var all = document.querySelectorAll('.my-form')
//     for (var i = 0; i< all.length; i++){
//         all.submit();
//     }

//     // document.querySelector('#my-form').submit();

// }


window.onload = function() {

        getLocation();

}

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
}

function showPosition(position) {
    document.querySelector('#loginLat').value = position.coords.latitude;
    document.querySelector('#loginLong').value = position.coords.longitude;

}

function accessDatabase() {
    let currentuserLat = readCookie('latitude');
    let currentuserLong = readCookie('longitude');

    var ajaxUrlOne = 'http://127.0.0.1:3000/post/sort/db';
    var responseHandlerOne = function() {

        var responseObjOne = JSON.parse(this.responseText);

        for (var i = 0; i < responseObjOne.rows.length; i++) {
            var ajaxUrlTwo = 'https://api.mapbox.com/directions/v5/mapbox/driving/' + (currentuserLong) + ',' + (currentuserLat) + ';' + (responseObjOne.rows[i].loclong) + ',' + (responseObjOne.rows[i].loclat) + '?access_token=pk.eyJ1IjoiY2xhcmFvbm1hcnMiLCJhIjoiY2puOHgxdnhlMGk5bTN0bnc2b2JiaXhuZSJ9.Bbd0prUBoCltNk8UOyFD0Q'

            console.log(ajaxUrlTwo);
            let numOne = responseObjOne.rows[i].post_id;

            var responseHandlerTwo = function() {

                var responseObjTwo = JSON.parse(this.responseText);
                console.log('isthisworking:',responseObjTwo)
                let numTwo = responseObjTwo.routes[0].duration;

                var ajaxUrlThree = 'http://127.0.0.1:3000/post/sort/loc?id=' + numOne + '&duration=' + numTwo;

                var responseHandlerThree = function() {
                    var responseObjThree = JSON.parse(this.responseText);
                    console.log('whatabouthtis:',responseObjThree)


                };
                var requestThree = new XMLHttpRequest();
                requestThree.addEventListener("load", responseHandlerThree);
                requestThree.open("GET", ajaxUrlThree);
                requestThree.send();



            }
            var requestTwo = new XMLHttpRequest();
            requestTwo.addEventListener("load", responseHandlerTwo);
            requestTwo.open("GET", ajaxUrlTwo);
            requestTwo.send();
        }

    };
    var requestOne = new XMLHttpRequest();
    requestOne.addEventListener("load", responseHandlerOne);
    requestOne.open("GET", ajaxUrlOne);
    requestOne.send();
}


function saveLocation() {
    var input = document.getElementById('location');
    var autocomplete = new google.maps.places.Autocomplete(input);
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        var place = autocomplete.getPlace();
        var lat = place.geometry.location.lat();
        var long = place.geometry.location.lng()


        document.getElementById('city2').value = place.name;
        document.getElementById('cityLat').value = lat;
        document.getElementById('cityLng').value = long;
        //alert("This function is working!");
        //alert(place.name);
        // alert(place.address_components[0].long_name);

    });
}google.maps.event.addDomListener(window, 'load', saveLocation);