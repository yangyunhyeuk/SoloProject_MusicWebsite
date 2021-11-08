
window.onload = function() {
    console.log("도착");
    let requestURL = 'https://discoveryprovider2.audius.co/v1/tracks/trending?app_name=/tracks/trending';
    let request = new XMLHttpRequest();
    request.open('GET', requestURL);
    request.responseType = 'json';
    request.send();
    request.onload = function () {
        let singer = request.response;
        console.log(singer);

        chart(singer['data']);
        // 배열을 넣어줘야 위 함수 for문에서 인식 가능
    }
}

function chart(jsonObj) {
    var datas = jsonObj;
    console.log("chart 입장");
    console.log(datas);


    for (var i = 0; i < datas.length; i++) {
        console.log(datas[i].artwork["150x150"]);
        console.log(datas[i].genre);
        console.log(datas[i].mood);
        console.log(datas[i].title);
        console.log(datas[i].user.name);
        console.log("");

        var div = document.createElement('div');
        var divnum = document.createElement('div');
        var num = document.createElement('span');
        var divcontent = document.createElement('div');
        var title = document.createElement('h3');
        var genre = document.createElement('span');
        var name = document.createElement('span');
        var divimg = document.createElement('div');
        var image = document.createElement('img');
        var br = document.createElement('br');

        div.setAttribute('class', 'audius');
        divnum.setAttribute('class', 'divnum');
        divcontent.setAttribute('class', 'divcontent');
        divimg.setAttribute('class', 'divimg');


        div.style.padding = '10px';
        div.style.width = '70%';
        div.style.display = 'flow-root';
        div.style.border = '1px solid lightgray';
        div.style.margin = 'auto';

        divnum.style.width = '22%';
        divnum.style.float = 'left';

        divcontent.style.width = '40%';
        divcontent.style.float = 'left';

        divimg.style.width = '35%';
        divimg.style.float = 'right';

        num.style.fontSize = '40px';
        num.style.lineHeight = '120px';
        num.style.padding = '10px';

        name.style.fontFamily = 'fantasy';
        name.style.fontSize = '25px';

        genre.style.fontFamily = 'fantasy';
        genre.style.fontSize = '17px';

        image.style.float = 'right';

        num.textContent = ' ' + (i + 1);
        title.textContent = datas[i].title;
        name.textContent = datas[i].user.name;
        genre.textContent = datas[i].genre;
        image.setAttribute('src', datas[i].artwork["150x150"]);

        div.appendChild(divnum);
        divnum.appendChild(num);

        div.appendChild(divcontent);
        divcontent.appendChild(title);
        divcontent.appendChild(name);
        divcontent.appendChild(name).append(br);
        divcontent.appendChild(genre);

        div.appendChild(divimg);
        divimg.appendChild(image);
        section.appendChild(div);
    }

}


$(document).ready(function () {
    $(function () {
        $('#homeup').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 8000);
            return false;
        });
        var scrollHeight = $(document).height();
        $('#homedown').click(function () {
            $('body,html').animate({scrollTop: ($('#footer').offset().top)}, 8000);
            return false;
        });
    });

});

$(document).ready(function () {
    var currentPosition = parseInt($(".quickmenu").css("top"));
    $(window).scroll(function () {
        var position = $(window).scrollTop();
        $(".quickmenu").stop().animate({"top": position + currentPosition + "px"}, 1000);
    });
});