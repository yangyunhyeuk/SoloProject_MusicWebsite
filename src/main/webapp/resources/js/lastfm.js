window.onload = function() {
    let requestURL = 'https://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=1dd53e937471c771bf487fccccf1c569&format=json';
    let request = new XMLHttpRequest();
    request.open('GET', requestURL);
    request.responseType = 'json';
    request.send();
    request.onload = function () {
        let singer = request.response;

        console.log(singer['artists'].artist);


        showHeroes(singer['artists'].artist);
    }
}

function showHeroes(jsonObj) {
    var heroes = jsonObj;


    var div = document.createElement('div');
    div.style.textAlign = 'center';

    for (var i = 0; i < heroes.length; i++) {

        var artistName = document.createElement('a');
        var sol = document.createElement('ol');

        var sl = document.createElement('li');
        var br = document.createElement("br");


        artistName.setAttribute('href', heroes[i].url);
        artistName.setAttribute('target', '_blank')
        artistName.setAttribute('style', 'font-size: 30px;')
        artistName.setAttribute('class', 'sol');

        //var artistUrl = document.createElement('a');

        artistName.textContent = (i + 1) + " " + heroes[i].name;
        //artistUrl.textContent = 'URL : ' + heroes[i].url;

        div.appendChild(sol);
        div.appendChild(sol).appendChild(sl);
        div.appendChild(sol).appendChild(sl).appendChild(artistName);
        //div.appendChild(sl);
        //div.appendChild(artistName);
        div.appendChild(br);
    }
    section.appendChild(div);
}