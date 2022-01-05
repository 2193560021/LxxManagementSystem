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
    var url = "../OrdersServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchAllComplete;
        req.send("type=search&method=searchByTel&order_owner_tel=" + getCookie("tel"));
    }
}

function searchAllComplete(){
    if(req.readyState === 4 && req.status === 200){
        var json =  JSON.parse(req.responseText);//转换为json对象
        document.getElementById("orders_num").innerText = 0
        document.getElementById("orders_0").innerText = 0
        document.getElementById("orders_1").innerText = 0


        document.getElementById("order_list_main").innerHTML = ""

        if(json.length > 0){

            for(let i=0; i < json.length; i++) {



                if(json[i].order_kind == "0"){


                    document.getElementById("orders_0").innerText = parseFloat(parseFloat(document.getElementById("orders_0").innerText) + json[i].order_amount).toFixed(2);


                    let kind = "-"
                    document.getElementById("order_list_main").innerHTML +=
                        '<div id="order_'+ i +'" class="col-xl-12 col-md-12 col-sm-12 order_list alert-danger sales_flower mb-3 p-2">\n' +
                        '                <h2 class="col-12 font-weight-bolder my-3 clearfix">' + json[i].order_text +
                        '\n' +
                        '                  <span class="float-right" style="font-size: 16px">'+ json[i].order_time +'</span>\n' +
                        '                </h2>\n' +
                        '                <h1 class="col-12 text-center">'+ kind + json[i].order_amount.toFixed(2) +'</h1>\n' +
                        '                <h4 class="col-12 text-right">余额：<span class="order_amount_sum_new">'+ json[i].order_amount_sum.toFixed(2)  +'</span>\n' +
                        '                  <i class="fa fa-trash-o fa-lg mx-1 order_delete" data-toggle="modal" data-target="#delModal" onclick="del('+ json[i].order_id +')"></i>\n' +
                        '                </h4>\n' +
                        '              </div>'
                }else if(json[i].order_kind == "1"){

                    document.getElementById("orders_1").innerText = parseFloat(parseFloat(document.getElementById("orders_1").innerText) + json[i].order_amount).toFixed(2);

                    let kind = "+"
                    document.getElementById("order_list_main").innerHTML +=
                        '<div id="order_'+ i +'"  class="col-xl-12 col-md-12 col-sm-12 order_list alert-success sales_flower mb-3 p-2">\n' +
                        '                <h2 class="col-12 font-weight-bolder my-3 clearfix">' + json[i].order_text +
                        '\n' +
                        '                  <span class="float-right" style="font-size: 16px">'+ json[i].order_time +'</span>\n' +
                        '                </h2>\n' +
                        '                <h1 class="col-12 text-center">'+ kind + json[i].order_amount.toFixed(2) +'</h1>\n' +
                        '                <h4 class="col-12 text-right">余额：<span class="order_amount_sum_new">'+ json[i].order_amount_sum.toFixed(2)  +'</span>\n' +
                        '                  <i class="fa fa-trash-o fa-lg mx-1 order_delete" data-toggle="modal" data-target="#delModal" onclick="del('+ json[i].order_id +')"></i>\n' +
                        '                </h4>\n' +
                        '              </div>'
                }

            }

            document.getElementById("orders_num").innerText = parseFloat(parseFloat(document.getElementById("orders_1").innerText) - parseFloat(document.getElementById("orders_0").innerText))

        }else {
            document.getElementById("order_list_main").innerHTML =
                "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 25px'>快去添加账单...</p> " +
                "<div id='order_0' hidden><div class='order_amount_sum_new'>0</div></div>"


        }
    }else {
        document.getElementById("order_list_main").innerHTML =
            "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 25px'>快去添加账单...</p> "
    }
}


function del(id){
    $("#delConfirm").click(function (){

        var url = "../OrdersServlet";
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

    if(document.getElementById("order_kind").value == "请选择收支类别"){
        document.getElementById("sendSuccessModalLabel").innerHTML = "<span class='text-danger'>添加失败</span>"
        document.getElementById("modal_body").innerHTML = "请选择收支类别后再添加"
        document.getElementById("modal_btn").classList.remove("btn-success")
        document.getElementById("modal_btn").classList.add("btn-danger")

        return false;
    }else if(document.getElementById("order_amount").value == "" || document.getElementById("order_text").value == ""){
        document.getElementById("sendSuccessModalLabel").innerHTML = "<span class='text-danger'>添加失败</span>"
        document.getElementById("modal_body").innerHTML = "请填写金额和标题"
        document.getElementById("modal_btn").classList.remove("btn-success")
        document.getElementById("modal_btn").classList.add("btn-danger")
        return false;
    }else {




        var url = "../OrdersServlet"
        if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
        else if (window.ActiveXObject)
            req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.open("post", url, true);
            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.onreadystatechange = addComplete;
            req.send("type=add&order_text="
                +encodeURIComponent(document.getElementById("order_text").value)
                +"&order_kind="
                +document.getElementById("order_kind").value
                +"&order_amount="
                +document.getElementById("order_amount").value
                +"&order_amount_sum_new="
                +document.getElementById("order_0").getElementsByClassName("order_amount_sum_new")[0].innerHTML
                +"&order_owner_tel="
                +encodeURIComponent(getCookie("tel"))
                +"&order_time="
                +encodeURIComponent(getCurrentDate())

            )
        }
    }
}

function addComplete(){
    if(req.readyState === 4 && req.status === 200){

        document.getElementById("sendSuccessModalLabel").innerHTML = "添加成功"
        document.getElementById("modal_body").innerHTML = "消费记录添加成功！"
        document.getElementById("modal_btn").classList.remove("btn-danger")
        document.getElementById("modal_btn").classList.add("btn-success")
        document.getElementById("order_text").value = ""
        document.getElementById("order_amount").value = ""
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