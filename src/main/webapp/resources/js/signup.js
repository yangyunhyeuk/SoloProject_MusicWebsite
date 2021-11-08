window.onload = function () {
    if (document.getElementById("maddress") != null) {
        document.getElementById("maddress").addEventListener("click", function () { //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode(
                {
                    oncomplete: function (data) { //선택시 입력값 세팅
                        document.getElementById("maddress").value = data.address; // 주소 넣기
                        document.querySelector("input[name=maddressDetail]").focus(); //상세입력 포커싱
                    }
                }).open();
        });
    }
}

function SignUp() {
    let mid = document.getElementById("mid");
    let checkID = document.getElementById("checkID").getAttribute('name');
    let mpw = document.getElementById("mpw");
    let rempw = document.getElementById("rempw");

    let mnickname = document.getElementById("mnickname");
    let mphone = document.getElementById("mphone");
    let memail = document.getElementById("memail");
    let maddress = document.getElementById("maddress");
    let maddressDetail = document.getElementById("maddressDetail");
    let agree = $("input:checkbox[name='agree']").is(":checked");

    let idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; // 비밀번호 유효성 검사
    let nickCheck = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/; // 닉네임 유효성 검사
    let phoneCheck = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/; // 휴대폰 유효성 검사
    let emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 유효성 검사

    if (mid.value == "") {
        alert("아이디를 입력하세요.");
        mid.focus();
        return false;
    } else if (!idRegExp.test(mid.value)) {
        alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
        mid.focus();
        return false;
    } else if (checkID == 'false') {
        alert("아이디 중복체크를 진행해주세요");
        mid.focus();
        return false;
    } else if (mpw.value == "") {
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
    } else if (maddress.value == "") {
        alert("주소를 입력하세요.");
        maddress.focus();
        return false;
    } else if (maddressDetail.value == "") {
        alert("상세 주소를 입력하세요.");
        maddressDetail.focus();
        return false;
    } else if (!agree) {
        alert("약관 동의를 체크하세요.");
        $('#demo-human').focus();  // 해당 체크박스로 포커스 이동.
        return false;
    } else {
        console.log(mid.value);
        console.log(mpw.value);
        console.log(mnickname.value);
        console.log(mphone.value);
        console.log(memail.value);
        console.log(maddress.value);
        console.log(maddressDetail.value);


        fetch("/join", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                mid: mid.value,
                mpw: mpw.value,
                mnickname: mnickname.value,
                mphone: mphone.value,
                memail: memail.value,
                maddress: maddress.value,
                maddressDetail: maddressDetail.value
            })
        }).then(response => response.text())
            .then(result => {
                console.log(result);
                if (result === "success") {
                    alert("회원가입 성공");
                    location.href = '/signin';
                } else if (result === "fail") {
                    alert("회원가입 실패");
                    location.href = '/main';
                } else {
                    alert("문제 발생");
                    location.href = '/main';
                }
            }).catch(e => console.log(e));
    }


}