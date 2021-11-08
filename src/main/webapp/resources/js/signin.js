function idCheck() {
    console.log("진입")
    var mid = document.getElementById("mid");
    var mpw = document.getElementById("mpw");

    if (mid.value == "") {
        alert("아이디를 입력하세요.");
        mid.focus();
    } else if (mpw.value == "") {
        alert("비밀번호를 입력하세요.");
        mpw.focus();
    } else {
        fetch("/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                mid: mid.value,
                mpw: mpw.value,
            })
        }).then(response => response.text())
            .then(result => {
                console.log(result);
                if (result === "success") {
                    location.href = '/main';
                } else if (result === "fail") {
                    alert("존재하지 않는 회원입니다.");
                    location.href = '/signin';
                } else {
                    alert("문제 발생");
                    location.href = '/main';
                }
            }).catch(e => console.log(e));
    }
}
