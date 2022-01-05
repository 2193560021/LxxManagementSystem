window.onload = function (){
    cookie_tel_search()
    searchAll();
}


function getCurrentDate() {
    var now = new Date();
    var year = now.getFullYear(); //得到年份
    var month = now.getMonth();//得到月份
    var date = now.getDate();//得到日期
    var day = now.getDay();//得到周几
    var hour = now.getHours();//得到小时
    var minu = now.getMinutes();//得到分钟
    var sec = now.getSeconds();//得到秒
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var time = "";
    time = year + "-" + month + "-" + date+ " " + hour + ":" + minu + ":" + sec;
    return time;
}


function search(){
    var url = "../CustomerServlet";
    if (window.XMLHttpRequest)
        req1 = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req1 = new ActiveXObject("Microsoft.XMLHTTP");
    if (req1) {
        //采用POST方式，异步传输
        req1.open("post", url, true);
        //POST方式，必须加入如下头信息设定
        req1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req1.onreadystatechange = searchComplete;
        req1.send("type=search&method=byTel&tel="+ getCookie("tel"));
    }
}

function searchComplete(){
    if(req.readyState === 4 && req.status === 200){
        var json =  JSON.parse(req.responseText);//转换为json对象

        if(json.length > 0){

        }else {
            document.getElementById("expressage_yes_list").setAttribute("style","display:none")
            document.getElementById("expressage_list_main").innerHTML =
                "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 25px'>快去买东西+添加取件码，一件快递都没有...</p> "

        }
    }else {
        document.getElementById("expressage_yes_list").setAttribute("style","display:none")
        document.getElementById("expressage_list_main").innerHTML =
            "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 25px'>快去买东西+添加取件码，一件快递都没有...</p> "
    }
}


function check(){
    var url = "../CustomerServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = checkComplete;
        req.send("type=update" +
            "&cusid=" + encodeURIComponent(document.getElementById("owner_id").value) +
            "&cusname=" + encodeURIComponent(document.getElementById("owner_name").value) +
            "&customerimg_bg=" + encodeURIComponent(document.getElementById("LSpace_countdown_bg").value))
    }
}

function checkComplete(){
    if(req.readyState === 4 && req.status === 200){
        cookie_tel_search()
    }
}




function isPic()
{
    var pic=document.getElementById("UserImgUploadFrom").user_image.value;
    var ext=pic.substring(pic.lastIndexOf(".")+1);
    //可以再添加允许类型
    if(ext.toLowerCase()=="jpg" || ext.toLowerCase()=="png" || ext.toLowerCase()=="gif")
        return true;
    else
    {
        alert("只能上传jpg、png、gif图像!");
        return false;
    }
}



// Cookie_search


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

            // 下面代码被保护
            document.getElementById("user_inf_main").setAttribute("style","")
            document.getElementById("user_inf_main").setAttribute("href","Person.html")
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
            document.getElementById("lou_out_btn").classList.add("btn-danger")
            document.getElementById("lou_out_btn").setAttribute("value","退出登录")
            document.getElementById("lou_out_btn").setAttribute("onclick","quit()")
            // 保护结束

            document.getElementById("owner_id").value = json[0].cus_id
            document.getElementById("img_user_id").value = json[0].cus_id
            document.getElementById("img_user_tel").value = json[0].cus_tel

            document.getElementById("user_bg").style.background = json[0].cus_img_bg
            document.getElementById("main_user_img_main").setAttribute("src",json[0].cus_img)
            document.getElementById("person_name").innerText = json[0].cus_name
            document.getElementById("person_tel").innerText = json[0].cus_tel
            document.getElementById("person_email").innerText = json[0].cus_email

            document.getElementById("user_editor").style.background = json[0].cus_img_bg
            document.getElementById("main_user_img_main1").setAttribute("src",json[0].cus_img)
            document.getElementById("person_name1").innerText = json[0].cus_name
            document.getElementById("owner_name").value = json[0].cus_name

            document.getElementById("person_tel1").innerText = json[0].cus_tel
            document.getElementById("owner_tel").value = json[0].cus_tel
            document.getElementById("person_email1").innerText = json[0].cus_email
            document.getElementById("owner_email").value = json[0].cus_email

            document.getElementById("person_img_upload").setAttribute("src",json[0].cus_img)


        }else {
            // 下面代码被保护
            document.getElementById("user_img").setAttribute("style","display:none")
            document.getElementById("log_out").setAttribute("class","fa fa-sign-in")
            document.getElementById("name").innerHTML = '请先登录'
            document.getElementById("log_out").setAttribute("onclick","goSign()")
            document.getElementById("log_out").setAttribute("style","color:#007bff")
            document.getElementById("user_inf_main").setAttribute("style","display:none")
            document.getElementById("user_inf_main").setAttribute("href","#")
            document.getElementById("lou_out_btn").classList.add("btn-primary")
            document.getElementById("lou_out_btn").setAttribute("value","登录/注册")
            document.getElementById("lou_out_btn").setAttribute("onclick","goSign()")
            // 保护结束


        }
    } else{
        // 下面代码被保护
        document.getElementById("user_img").setAttribute("style","display:none")
        document.getElementById("log_out").setAttribute("class","fa fa-sign-in")
        document.getElementById("name").innerText = '请先登录'
        document.getElementById("log_out").setAttribute("onclick","goSign()")
        document.getElementById("log_out").setAttribute("style","color:#007bff")
        document.getElementById("user_inf_main").setAttribute("style","display:none")
        document.getElementById("user_inf_main").setAttribute("href","#")
        document.getElementById("lou_out_btn").classList.add("btn-primary")
        document.getElementById("lou_out_btn").setAttribute("value","登录/注册")
        document.getElementById("lou_out_btn").setAttribute("onclick","goSign()")
        // 保护结束
    }
}

function goSign(){
    window.location = '../index.html'
}


