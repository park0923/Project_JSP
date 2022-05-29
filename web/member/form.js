function confirmLogin() {
    if(document.login_form.id.value === ""){
        alert("아이디를 입력하세요.");
        document.login_form.id.focus();
        return;
    }

    if(document.login_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.login_form.pw.focus();
        return;
    }

    document.login_form.submit();
}

function confirmJoin() {
    if(document.join_form.id.value === ""){
        alert("아이디를 입력하세요.");
        document.join_form.id.focus();
        return;
    }

    if(document.join_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.join_form.pw.focus();
        return;
    }

    if(document.join_form.name.value === ""){
        alert("이름을 입력하세요.");
        document.join_form.name.focus();
        return;
    }
    document.join_form.submit();
}

function confirmPassword(){
    if(document.check_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.check_form.pw.focus();
        return;
    }
    document.check_form.submit();
}

function confirmModify() {
    if(document.modify_form.id.value === ""){
        alert("아이디를 입력하세요.");
        document.modify_form.id.focus();
        return;
    }
    if(document.modify_form.pw.value === ""){
        alert("비밀번호를 입력하세요.");
        document.modify_form.pw.focus();
        return;
    }
    if(document.modify_form.name.value === ""){
        alert("이름을 입력하세요.");
        document.modify_form.id.focus();
        return;
    }
    if(document.modify_form.phone.value === ""){
        alert("전화번호를 입력하세요.");
        document.modify_form.id.focus();
        return;
    }
    if(document.modify_form.email.value === ""){
        alert("이메일을 입력하세요.");
        document.modify_form.id.focus();
        return;
    }
    document.modify_form.submit();
}

function confirmCheck(){
    if (confirm("정말로 아이디를 삭제하시겠습니까??")){
        location.href="deleteMember.jsp";
    }else{
        return;
    }
    document.change_form.submit();
}

function changePassWordPopUp(){
    open("changePwForm.jsp",'pop01' ,'top=10, left=10, width=800, height=800, status=no, menubar=no, toolbar=no, resizable=no');
}

function confirmChange() {
    if(document.change_form.before_pw.value === ""){
        alert("현재 비밀번호를 입력하세요.");
        document.check_after_pw.id.focus();
        return;
    }

    if(document.change_form.after_pw.value === ""){
        alert("새로운 비밀번호를 입력하세요.");
        document.check_after_pw.pw.focus();
        return;
    }

    if(document.change_form.check_after_pw.value === ""){
        alert("비밀번호 확인을 입력하세요.");
        document.check_after_pw.name.focus();
        return;
    }

    if(document.change_form.after_pw.value !== document.change_form.check_after_pw.value){
        alert("새로운 비밀번호와 확인용이 비밀번호가 다릅니다.");
        document.change_form.check_after_pw.focus();
        return;
    }

    if(document.change_form.after_pw.value === document.change_form.before_pw.value){
        alert("기존의 비밀번화와 새로운 비밀번호가 같습니다.");
        document.change_form.check_after_pw.focus();
        return;
    }

    document.change_form.submit();
}

function cancelChange(){
    document.change_form.window.close();
}

function AdminModifySendId(id){
    session.setAttribute("Uid", id);
}