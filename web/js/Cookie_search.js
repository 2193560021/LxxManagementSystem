
function quit(){
    document.cookie = "tel=???;path=/";
    window.location = "../index.html";
}

function getCookie(c_name)
{
    if (document.cookie.length>0)
    {
        c_start=document.cookie.indexOf(c_name + "=")
        if (c_start!=-1)
        {
            c_start=c_start + c_name.length+1
            c_end=document.cookie.indexOf(";",c_start)
            if (c_end==-1) c_end=document.cookie.length
            return unescape(document.cookie.substring(c_start,c_end))
        }
    }
    return ""
}

function cookie_tel_search(){
    var url = "../CustomerServlet";
    if (window.XMLHttpRequest)
        req1 = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req1 = new ActiveXObject("Microsoft.XMLHTTP");
    if (req1) {
        //采用POST方式，异步传输
        req1.open("post", url, true);
        req1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req1.onreadystatechange = cookie_tel_searchComplete;
        req1.send("type=search&method=byTel&tel=" + getCookie("tel"));
    }
}

function cookie_tel_searchComplete(){
    if (req1.readyState == 4 && req1.status == 200) {
        var json =  JSON.parse(req1.responseText);//转换为json对象
        if(json.length > 0){
            document.getElementById("user_name").value = json[0].cus_name
            document.getElementById("user_tel").value = json[0].cus_tel

            document.getElementById("log_out").setAttribute("class","fa fa-sign-out")
            document.getElementById("log_out").setAttribute("style","color:#dc3545")

            document.getElementById("user_tel").value = json[0].cus_tel
            document.getElementById("user_img").setAttribute("src",json[0].cus_img)

            document.getElementById("user_img_sm").setAttribute("src",json[0].cus_img)


            document.getElementById("user_img").setAttribute("style","")
            document.getElementById("user_img_sm").setAttribute("style","border-radius: 5px")

            document.getElementById("name").innerText = json[0].cus_name
            document.getElementById("tel").innerText = json[0].cus_tel
            document.getElementById("name_sm").innerText = json[0].cus_name
            document.getElementById("tel_sm").innerText = json[0].cus_tel


            document.getElementById("log_out").setAttribute("onclick","quit()")



        }else {
            document.getElementById("user_img").setAttribute("style","display:none")

            document.getElementById("log_out").setAttribute("class","fa fa-sign-in")
            document.getElementById("name").innerHTML = '请先登录'
            document.getElementById("log_out").setAttribute("onclick","goSign()")
            document.getElementById("log_out").setAttribute("style","color:#007bff")


        }
        //    修改资料
    } else{

        document.getElementById("user_img").setAttribute("style","display:none")
        document.getElementById("log_out").setAttribute("class","fa fa-sign-in")
        document.getElementById("name").innerText = '请先登录'
        document.getElementById("log_out").setAttribute("onclick","goSign()")
        document.getElementById("log_out").setAttribute("style","color:#007bff")

    }
}

function goSign(){
    window.location = '../index.html'
}


