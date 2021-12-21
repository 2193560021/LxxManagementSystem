
function search(){
    var path;
    var tel = /^1[3,4,5,7,8]\d{9}$/;
    var email = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,6}$/;
    var User = document.getElementById("emailOrTel").value;
    if(tel.test(User)){
        path = "tel"
    }else if(email.test(User)){
        path = "email"
    }else {
        path = "啥也不是"
    }


    var url = "../CustomerServlet";
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        //采用POST方式，异步传输
        req.open("post", url, true);
        //POST方式，必须加入如下头信息设定
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchComplete;
        req.send("type=login&method=login&path="+ path +"&data="+document.getElementById("emailOrTel").value+"&pwd="+document.getElementById("password").value);
    }
}

function searchComplete() {
    if (req.readyState == 4 && req.status == 200) {
        if(req.responseText == "failed"){
            setTimeout(failSignIn, 100);
        } else {
            setTimeout(SignInSuccess,100);
            document.cookie = "tel=" + req.responseText;
            console.log(document.cookie);
        }

    }
}



var card = document.getElementsByClassName("container");
var bg = document.getElementsByTagName("section");
function failSignIn(){
    card[0].classList.remove("bounceInDown");
    card[0].classList.add("shake");
    bg[0].classList.add("fail");
    setTimeout(failSignIn_animateRemove,1200);
}
function failSignIn_animateRemove(){
    card[0].classList.remove("shake");
    bg[0].classList.remove("fail");
}


function check() {
    var form = document.getElementById("form_signUp");
    if(form.customername.value=="" || form.customertel.value=="" || form.customeremail.value=="" || form.customerpwd.value=="" || form.customercfmpwd.value=="") {
        failSignIn();
        return;
    }
    var url = "../CustomerServlet";
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req && checkcfmpwd()) {
        //采用POST方式，异步传输
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = checkComplete;
        var data = "type=" + form.type.value + "&cusname="
            + encodeURIComponent(form.customername.value)+ "&custel="
            + encodeURIComponent(form.customertel.value) + "&cusemail="
            + encodeURIComponent(form.customeremail.value) + "&customerpwd="
            + encodeURIComponent(form.customerpwd.value);
        req.send(data);
    }else {
        failSignIn();
    }
}

function checkName(){
    var name = document.getElementById("customername");
    if(name.value == "" || name.value == null){
        name.style.background = "#ffb0b0";
        return false;
    }else{
        name.style.background = "#abffab";
        return true;
    }
}

//校验手机号
function checkTel(){
    checkField("customertel",/^1[3,4,5,7,8]\d{9}$/);
}

function checkMail() {
    checkField("customeremail",/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,6}$/);
}

function checkPwd(){
    //获取用户的密码信息
    var pwd = document.getElementById("customerpwd");
    //创建校验规则
    var reg = /^[A-Za-z0-9-_.\d]{6,16}$/;
    //开始校验
    if(reg.test(pwd.value)){
        //输出校验结果
        pwd.style.background = "#abffab";
        return true;
    }else{
        //输出校验结果
        pwd.style.background = "#ffb0b0";
        return false;
    }
}

//校验确认密码
function checkcfmpwd(){
    //获取密码
    var pwd1 = document.getElementById("customerpwd");
    //获取确认密码
    var pwd2 = document.getElementById("customercfmpwd");

    //比较
    if(pwd1.value==pwd2.value && checkPwd()){
        pwd2.style.background = "#abffab";
        return true;
    }else {
        pwd2.style.background = "#ffb0b0";
        return false;
    }
}

//封装校验：相同的保留，不同的传参。
function checkField(id,reg){
    //获取用户数据
    var inp = document.getElementById(id);
    var va=inp.value;
    console.log(reg.test(va));
    //获取span对象
    //开始校验
    if(reg.test(va)){
        //输出校验规则
        inp.style.background = "#abffab";
        return true;
    }else{
        //输出校验规则
        inp.style.background = "#ffb0b0";
        return false;
    }
}

function checkComplete() {
    if (req.readyState == 4 && req.status == 200) {
        if(req.responseText == 3){
            setTimeout(failSignIn, 100);
            document.getElementById("customeremail").style.background = "#ffb0b0";
            document.getElementById("customeremail").value = "";
            document.getElementById("customeremail").setAttribute("placeholder","邮箱已经被注册了,祖银换一个吧");
        } else if(req.responseText == 4){
            setTimeout(failSignIn, 100);
            document.getElementById("customertel").style.background = "#ffb0b0";
            document.getElementById("customertel").value = "";
            document.getElementById("customertel").setAttribute("placeholder","电话已经被注册了,祖银换一个吧");
        }else {
            setTimeout(SignUpSuccess,100);
            document.getElementById("customeremail").setAttribute("placeholder","邮箱地址");
            document.getElementById("customertel").setAttribute("placeholder","电话号码");

        }
    }
}

function SignUpSuccess(){
    bg[0].classList.remove("active");
    card[0].classList.remove("active");
    card[0].classList.add("bounce");
    bg[0].classList.add("success");
    document.getElementById("form_signUp").reset();
    var input_signup = document.getElementById("form_signUp").getElementsByTagName("input");
    for (var i = 0;i < input_signup.length-1;i++){
        input_signup[i].style.background = "#f5f5f5";
    }
    setTimeout(successSignUp_animateRemove,900);
}

function successSignUp_animateRemove(){
    card[0].classList.remove("bounce");
    bg[0].classList.remove("success");
}

function SignInSuccess(){
    bg[0].classList.remove("active");
    card[0].classList.remove("active");
    card[0].classList.add("bounce");
    bg[0].classList.add("success");
    setTimeout(successSignIn_animateRemove,1500);

}

function successSignIn_animateRemove(){
    card[0].classList.remove("bounce");
    bg[0].classList.remove("success");
    window.location = "Sign.html";
}