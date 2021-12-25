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
    var url = "../ExpressagesServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchAllComplete;
        req.send("type=search&method=searchByTel&expressage_owner_tel=" + getCookie("tel"));
    }
}

function searchAllComplete(){
    if(req.readyState === 4 && req.status === 200){
        var json =  JSON.parse(req.responseText);//转换为json对象

        document.getElementById("expressages_num").innerText = 0
        document.getElementById("expressages_0").innerText = 0
        document.getElementById("expressages_1").innerText = 0

        if(json.length > 0){

            document.getElementById("expressages_num").innerHTML = json.length
            document.getElementById("expressage_list_main").innerHTML = ""
            document.getElementById("expressage_yes_list_main").innerHTML = ""
            let b=0
            for(let i=0; i < json.length; i++) {
                if(json[i].expressage_status === "0"){
                    document.getElementById("expressages_0").innerText = parseInt(parseInt(document.getElementById("expressages_0").innerText) + 1);



                    document.getElementById("expressage_list_main").innerHTML +=
                        '<div class="expressage_card_list mx-auto sales_flower mx-1 shadow row mb-3">\n' +
                        '                <div class="col-xl-2 col-md-2 col-sm-2 rounded-circle mb-2 pt-1 text-center">\n' +
                        '                  <img src="../img/Expressage_img/'+ json[i].expressage_company.split("&")[1] +'" alt="" class="expressage_card_list_img mt-4 mb-1">\n' +
                        '                  <span class="mx-auto text-center font-weight-bolder ">'+ json[i].expressage_company.split("&")[0] +'</span>\n' +
                        '                </div>\n' +
                        '                <div class="col-xl-10 col-md-10 col-sm-10 expressage_card_content text-center pt-5 pb-4">\n' +
                        '                  <span class="expressage_card_content_code mx-auto font-weight-bolder">'+ json[i].expressage_code +'</span>\n' +
                        '                  <span class="expressage_card_content_other mx-auto text-center font-weight-bolder mt-2"><span class="expressage_card_content_time">'+ json[i].expressage_time +'</span>\n' +
                        '                  <i class="fa fa-check  fa-lg mx-1 expressage_check"  data-toggle="modal" data-target="#checkModal" onclick="check('+ json[i].expressage_id +')"></i>\n' +
                        '                  <i class="fa fa-trash-o fa-lg mx-1 expressage_delete" data-toggle="modal" data-target="#delModal" onclick="del('+ json[i].expressage_id +')"></i>\n' +
                        '                  </span>\n' +
                        '                </div>\n' +
                        '              </div>'

                }else if(json[i].expressage_status === "1"){


                    document.getElementById("expressages_1").innerText = parseInt(parseInt(document.getElementById("expressages_1").innerText) + 1);


                    document.getElementById("expressage_yes_list").setAttribute("style","")


                    document.getElementById("expressage_yes_list_main").innerHTML +=
                        '              <div class="expressage_card_list mx-auto sales_flower mx-1 shadow row mb-3">\n' +
                        '                <div class="col-xl-2 col-md-2 col-sm-2 rounded-circle mb-2 pt-1 text-center">\n' +
                        '                  <img src="../img/Expressage_img/'+ json[i].expressage_company.split("&")[1] +'" alt="" class="expressage_card_list_img mt-4 mb-1">\n' +
                        '                  <span class="mx-auto text-center font-weight-bolder ">'+ json[i].expressage_company.split("&")[0] +'</span>\n' +
                        '                </div>\n' +
                        '                <div class="col-xl-10 col-md-10 col-sm-10 expressage_card_content text-center py-4">\n' +
                        '                  <span class="expressage_card_content_code mx-auto font-weight-bolder ">'+ json[i].expressage_code +'</span>\n' +
                        '                  <span class="expressage_card_content_other mx-auto text-center font-weight-bolder mt-3"><span class="expressage_card_content_time">'+ json[i].expressage_yes_time +'</span>\n' +
                        '                  <i class="fa fa-repeat  fa-lg mx-1 expressage_repeat" data-toggle="modal" data-target="#repeatModal"  onclick="repeat('+ json[i].expressage_id +')"></i>\n' +
                        '                  <i class="fa fa-trash-o fa-lg mx-1 expressage_delete" data-toggle="modal" data-target="#delModal" onclick="del('+ json[i].expressage_id +')"></i>\n' +
                        '                  </span>\n' +
                        '                </div>\n' +
                        '              </div>'
                }


                if(document.getElementById("expressages_0").innerHTML === "0"){
                    document.getElementById("expressage_list_main").innerHTML =
                        "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 25px'>快去买东西+添加取件码，一件快递都没有...</p> "

                }


            }
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


function del(id){
    $("#delConfirm").click(function (){

        var url = "../ExpressagesServlet";
        if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
        else if (window.ActiveXObject)
            req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            //采用POST方式，异步传输
            req.open("post", url, true);
            //POST方式，必须加入如下头信息设定
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.onreadystatechange = delComplete;
            req.send("type=delete&id="+id);
        }
    })
}

function delComplete(){
    if(req.readyState === 4 && req.status === 200){
        searchAll()
    }
}


function delAll(){
    $("#delAllConfirm").click(function (){

        var url = "../ExpressagesServlet";
        if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
        else if (window.ActiveXObject)
            req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            //采用POST方式，异步传输
            req.open("post", url, true);
            //POST方式，必须加入如下头信息设定
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.onreadystatechange = delAllComplete;
            req.send("type=deleteAllYes");
        }
    })
}

function delAllComplete(){
    if(req.readyState === 4 && req.status === 200){
        searchAll()
    }
}




function add(){

    var url = "../ExpressagesServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = addComplete;
        req.send("type=add&expressage_code="
            +encodeURIComponent(document.getElementById("expressage_code").value)
            +"&expressage_company="
            +encodeURIComponent(document.getElementById("expressage_company_name").value)
            +"&expressage_time="
            +encodeURIComponent(getCurrentDate())
            +"&expressage_owner_tel="
            +encodeURIComponent(getCookie("tel"))

        )
    }
}

function addComplete(){
    if(req.readyState === 4 && req.status === 200){
        document.getElementById("expressage_code").value = ''
        searchAll()
    }
}

function check(id){
    $("#checkConfirm").click(function (){
        var url = "../ExpressagesServlet"
        if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
        else if (window.ActiveXObject)
            req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.open("post", url, true);
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.onreadystatechange = checkComplete;
            req.send("type=check&expressage_id=" + id + "&expressage_yes_time=" + encodeURIComponent(getCurrentDate()))
        }
    })
}

function checkComplete(){
    if(req.readyState === 4 && req.status === 200){
        searchAll()
    }
}

function repeat(id){

    $("#repeatConfirm").click(function (){
        var url = "../ExpressagesServlet"
        if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
        else if (window.ActiveXObject)
            req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.open("post", url, true);
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.onreadystatechange = repeatComplete;
            req.send("type=repeat&expressage_id=" + id + "&expressage_time=" + encodeURIComponent(getCurrentDate()))
        }
    })
}

function repeatComplete(){
    if(req.readyState === 4 && req.status === 200){
        searchAll()
    }
}