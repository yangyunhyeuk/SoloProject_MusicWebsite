

window.onload = function() {
    var requestURL = "http://api.napster.com/v2.2/artists/top?apikey=YTkxZTRhNzAtODdlNy00ZjMzLTg0MWItOTc0NmZmNjU4Yzk4&format=json";

    let request = new XMLHttpRequest();
    request.open('GET', requestURL);
    request.responseType = 'json';
    request.send();
    request.onload = function () {
        let singer = request.response;
        console.log(singer);
        console.log(singer['artists']);

        showHeroes(singer['artists']);
    }
}

function showHeroes(jsonObj) {
    var heroes = jsonObj;


    for (var i = 0; i < heroes.length; i++) {
        console.log("반복문");
        var atag = document.createElement('a');
        var h2 = document.createElement('h2');
        var br = document.createElement("br");
        var img = document.createElement("img");

        var outdiv = document.createElement('div');
        // outdiv.setAttribute('class', 'col-md-4');
        outdiv.style.textAlign= 'center';

        var indiv = document.createElement('div');
        indiv.setAttribute('class', 'post');


        atag.setAttribute('class', 'post-img');
        atag.setAttribute('href', 'https://us.napster.com/artist/' + heroes[i].name.toLowerCase().replace(" ", "-").replace("/","").replace(" ", "-"));
        atag.setAttribute('target', '_blank');
        img.setAttribute('src', 'https://api.napster.com/imageserver/v2/artists/' + heroes[i].id + "/images/300x300.jpg");
        img.style.width = '20%';
        atag.appendChild(br);

        h2.setAttribute('class', 'title');
        h2.textContent = (i+1)+'    '+heroes[i].name;

        var lastdiv = document.createElement('div');
        lastdiv.setAttribute('class', 'section-title');

        outdiv.append(indiv,lastdiv);
        indiv.appendChild(atag);
        indiv.appendChild(atag).appendChild(img);

        lastdiv.appendChild(h2);

        section.appendChild(outdiv);
    }

}