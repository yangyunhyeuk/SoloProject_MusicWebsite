window.onload = function () {

    $.ajax({
        type: 'GET',
        url: "/getMember",
        success: function (data) {
            console.log(data);

            let mid = data.mid;
            let mpw = data.mpw;
            let mnickname = data.mnickname;
            let mphone = data.mphone;
            let memail = data.memail;
            let maddress = data.maddress;


            $('input[name=mid]').attr("value", mid);
            $('input[name=mid]').attr("style", 'background-color: lightgray;');
            $("div.col-md-4 div.aside-widget div.category-widget ul li:last-child a").attr("href", "/quit?mid=" + mid);
            $('input[name=mpw]').attr("value", mpw);
            $('input[name=rempw]').attr("value", mpw);
            $('input[name=mnickname]').attr("value", mnickname);
            $('input[name=mphone]').attr("value", mphone);
            $('input[name=memail]').attr("value", memail);
            $('input[name=maddress]').attr("value", maddress);
            $('input[name=maddress]').attr("style", 'background-color: lightgray;');

        }
    })
};


// 비밀번호 닉네임 휴대폰번호 이메일
function editMyinfo() {
    let mpw = document.getElementById("mpw");
    let rempw = document.getElementById("rempw");
    let mnickname = document.getElementById("mnickname");
    let mphone = document.getElementById("mphone");
    let memail = document.getElementById("memail");

    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; // 비밀번호 유효성 검사
    let nickCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/; // 닉네임 유효성 검사
    let phoneCheck = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/; // 휴대폰 유효성 검사
    let emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 유효성 검사

    if (mpw.value == "") {
        alert("비밀번호를 입력하세요.");
        mpw.focus();
        return false;
    } else if (rempw.value !== mpw.value) {
        alert("비밀번호가 일치하지 않습니다.");
        rempw.focus();
        return false;
    } else if (!pwdCheck.test(mpw.value)) { // 비밀번호 유효성 검사
        alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야합니다.");
        mpw.focus();
        return false;
    } else if (mnickname.value == "") {
        alert("닉네임을 입력하세요.");
        mnickname.focus();
        return false;
    } else if (!nickCheck.test(mnickname.value)) { // 비밀번호 유효성 검사
        alert("닉네임은 특수문자 제외 2 ~ 10자로 입력해주세요.");
        mnickname.focus();
        return false;
    } else if (mphone.value == "") {
        alert("'-'를 포함한 휴대폰 번호를 입력하세요.");
        mphone.focus();
        return false;
    } else if (!phoneCheck.test(mphone.value)) { // 비밀번호 유효성 검사
        alert("휴대폰 번호 확인 후 입력바랍니다.");
        mphone.focus();
        return false;
    } else if (memail.value == "") {
        alert("이메일을 입력하세요.");
        memail.focus();
        return false;
    } else if (!emailRegExp.test(memail.value)) {
        alert("이메일 주소 확인 후 다시 작성하시기 바랍니다.");
        memail.focus();
        return false;
    } else {
        console.log("여기부터 시작");
        console.log(mid);
        console.log(mid.value);
        console.log(mpw.value);
        console.log(mnickname.value);
        console.log(mphone.value);
        console.log(memail.value);
        console.log(maddress.value);


        fetch("/editMyinfo", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                mpw: mpw.value,
                mnickname: mnickname.value,
                mphone: mphone.value,
                memail: memail.value,
                mid: mid.value
            })
        }).then(response => response.text())
            .then(result => {
                console.log(result);
                if (result === "success") {
                    alert("회원정보 수정 완료");
                    location.href = '/fav/list';
                } else if (result === "fail") {
                    alert("회원정보 수정 실패");
                    location.href = '/fav/list';
                } else {
                    alert("문제 발생");
                    location.href = '/fav/list';
                }
            }).catch(e => console.log(e));
    }


}

function check() {
    var result = confirm("정말 탈퇴하시겠습니까?");
    if (result == true) {
        location.href = '/quit?mid=${mid}';
    } else {
        return false;
    }
}