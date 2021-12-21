window.onload = function (){
    searchAll();
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
        req.send("type=search&method=search&message_accept_tel=" + document.getElementById("message_accept_tel").value);
    }
}

function searchAllComplete(){
    if(req.readyState === 4 && req.status === 200){
        var json =  JSON.parse(req.responseText);//转换为json对象
        document.getElementById("messages_list").innerHTML = ""
        for(let i=0; i < json.length; i++) {
            document.getElementById("messages_list").innerHTML +=
                '                  <div class="messages_card_list mx-auto sales_flower mx-1 shadow row mb-3">\n' +
                '                    <div class="col-xl-2 col-md-2 col-sm-2 rounded-circle mb-2 text-center">\n' +
                '                      <img src="'+ json[i].message_send_user_img +'" alt="" class="messages_card_list_img rounded-circle mt-2">\n' +
                '                      <span class="mx-auto text-center font-weight-bolder mt-1">'+ json[i].message_send_name +'</span>\n' +
                '                    </div>\n' +
                '                    <div class="col-xl-10 messages_card_content mt-2 mb-2 pt-2">\n' +
                '                      <span class="messages_card_content_text mx-auto text-center font-weight-bolder mt-3">'+ json[i].message_text +'</span>\n' +
                '                      <span class="messages_card_content_time mx-auto text-center font-weight-bolder mt-3">'+ json[i].message_time +'</span>\n' +
                '                    </div>\n' +
                '                  </div>'
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
        req.send("type=search&method=search&name="+document.getElementById("message_title").value);
    }
}

function addComplete(){
    if(req.readyState === 4 && req.status === 200){

    }
}