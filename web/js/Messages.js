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


function searchAll(){
    var url = "../MessagesServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchAllComplete;
        req.send("type=search&method=searchByTel&message_accept_tel=" + getCookie("tel"));
    }
}

function searchAllComplete(){
    if(req.readyState === 4 && req.status === 200){
        var json =  JSON.parse(req.responseText);//转换为json对象
        if(json.length > 0){
            document.getElementById("messages_num").innerHTML = json.length
            document.getElementById("messages_list").innerHTML = ""
            for(let i=0; i < json.length; i++) {
                document.getElementById("messages_list").innerHTML +=
                '                  <div class="messages_card_list mx-auto sales_flower mx-1 shadow row mb-3">\n' +
                '                    <div class="col-xl-2 col-md-2 col-sm-2 rounded-circle mb-2 text-center">\n' +
                '                      <img src="'+ json[i].message_send_user_img +'" alt="" class="messages_card_list_img rounded-circle mt-2">\n' +
                '                      <span class="mx-auto text-center font-weight-bolder mt-1">'+ json[i].message_send_name +'</span>\n' +
                '                    </div>\n' +
                '                    <div class="col-xl-10 col-md-10 col-sm-10 messages_card_content mt-2 mb-2 pt-2">\n' +
                '                      <span class="messages_card_content_text mx-auto text-center font-weight-bolder mt-3">'+ json[i].message_text +'</span>\n' +
                '                      <span class="messages_card_content_time mx-auto text-center font-weight-bolder mt-3">'+ json[i].message_time +'</span>\n' +
                '                    </div>\n' +
                '                  </div>'
            }
        }else {
            document.getElementById("messages_num").innerHTML = "0"
            document.getElementById("messages_list").style.height = 200
            document.getElementById("messages_list").innerHTML =
                "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 35px'>😭你没人爱了，一条消息都没有</p> "
        }
        searchAccept()
    }
}

function searchAccept(){
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
        req1.onreadystatechange = searchAcceptComplete;
        req1.send("type=search&method=search&tel=");
    }
}

function searchAcceptComplete(){
    if(req.readyState == 4 && req.status == 200){
        var json1 = JSON.parse(req1.responseText)
        document.getElementById("accept_name").innerHTML = '<option selected>请选择收方...</option>'
        for(let i = 0;i < json1.length;i++){
            if(json1[i].tel !== getCookie("tel")){
                document.getElementById("accept_name").innerHTML +=
                    '<option value="'+ json1[i].name +'-'+ json1[i].tel +'">'+ json1[i].name +'</option>'
            }
        }
    }
}




function add(){

    var url = "../MessagesServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = addComplete;
        req.send("type=add&message_send_name="
            +encodeURIComponent(document.getElementById("user_name").value)
            +"&message_send_tel="
            +encodeURIComponent(document.getElementById("user_tel").value)
            +"&message_accept_name="
            +encodeURIComponent(document.getElementById("accept_name").value.split("-")[0])
            +"&message_accept_tel="
            +encodeURIComponent(document.getElementById("accept_name").value.split("-")[1])
            +"&message_time="
            +encodeURIComponent(getCurrentDate())
            +"&message_send_user_img="
            +encodeURIComponent(document.getElementById("user_img").getAttribute("src"))
            +"&message_text="
            +encodeURIComponent(document.getElementById("message_text").value)

        )
    }
}

function addComplete(){
    if(req.readyState === 4 && req.status === 200){
        document.getElementById("message_text").value = ''
    }
}