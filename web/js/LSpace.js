window.onload = function (){
    cookie_tel_search()
    searchLovers();

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


function searchLovers(){
    var url = "../LSpaceServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchLoversComplete;
        req.send("type=search&LSpace_owner_tel=" + getCookie("tel"));
    }
}

function searchLoversComplete() {
    if (req.readyState === 4 && req.status === 200) {
        var json = JSON.parse(req.responseText);//转换为json对象

        if (json.length > 0) {
            console.log("搜索到了")
            console.log("时间：" + json[0].LSpace_time)

            document.getElementById("LSpace_countdown_owners_id").value = json[0].LSpace_id
            document.getElementById("LSpaceImgWall_owners_id").value = json[0].LSpace_id

            document.getElementById("LSpace_header").innerHTML =
                '<div class="my-4 col-xl-12 col-md-12 col-sm-12 float-left">\n' +
                '          <div class="card mb-4  main_card animated flipInX shadow">\n' +
                '            <div class="card-body p-3">\n' +
                '              <div class="row">\n' +
                '                <div id="LSpace_title" class="col-12">\n' +
                '                  <div class="numbers clearfix">\n' +
                '                    <img id="L1" src="" class="rounded-circle col-xl-2 col-md-3 col-sm-3 float-left" alt="">\n' +
                '                    <div class="text-center col-xl-8 col-md-6 col-sm-6 float-left">\n' +
                '                      <span class="col-xl-5 l_small" >💕💕</span>\n' +
                '                      <span class="col-xl-2 l_big">❤️</span>\n' +
                '                      <span class="col-xl-5 l_small" >💕💕</span>\n' +
                '                    </div>\n' +
                '                    <img id="L2" src="" class="rounded-circle col-xl-2 col-md-3 col-sm-3 float-right" alt="">\n' +
                '                  </div>\n' +
                '                </div>\n' +
                '              </div>\n' +
                '            </div>\n' +
                '          </div>\n' +
                '        </div>'


            document.getElementById("LSpace_time_card").innerHTML =
                '        <div class="card mb-4  main_card animated flipInX shadow" style="background: #f92f60">\n' +
                '          <div class="card-body p-3">\n' +
                '            <div class="row">\n' +
                '              <div id="LSpace_days_1" class="col-12 text-light">\n' +
                '                <div class="numbers clearfix text-center">\n' +
                '                  <h2 class="font-weight-bolder my-3">相恋天数</h2>\n' +
                '                  <h1>\n' +
                '                    <span id="L_day" style="font-size: 100px">00</span>天\n' +
                '                    <br id="br_day">\n' +
                '                    <span id="L_hour" style="font-size: 50px">00</span>时\n' +
                '                    <span id="L_minute" style="font-size: 50px">00</span>分\n' +
                '                    <span id="L_second" style="font-size: 50px">00</span>秒\n' +
                '                  </h1>\n' +
                '                  <h5>始于 <span id="LSpace_time">0000-00-00</span></h5>\n' +
                '                </div>\n' +
                '              </div>\n' +
                '            </div>\n' +
                '          </div>\n' +
                '        </div>'


            var L1 = json[0].LSpace_lovers.split("-")[0]
            var L2 = json[0].LSpace_lovers.split("-")[1]
            searchCus1(L1)
            searchCus2(L2)
            document.getElementById("LSpace_time").innerHTML = json[0].LSpace_time

            let startTime = new Date(json[0].LSpace_time.toString()); // 开始时间
            let endTime = new Date(); // 结束时间
            var intDiff_L = parseInt(Math.floor((endTime - startTime) / 1000));

            window.setInterval(function(){
                var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
                if(intDiff_L > 0){
                    day = Math.floor(intDiff_L / (60 * 60 * 24));
                    hour = Math.floor(intDiff_L / (60 * 60)) - (day * 24);
                    minute = Math.floor(intDiff_L / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(intDiff_L) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#L_day').html(day);
                $('#L_hour').html('<s id="h"></s>'+hour);
                $('#L_minute').html('<s></s>'+minute);
                $('#L_second').html('<s></s>'+second);
                intDiff_L++;
            }, 1000);

            searchCountdown()
        }else {
            console.log("有点错误")
            document.getElementById("main").innerHTML =
                '      <div class="my-4 col-xl-12 col-md-12 col-sm-12 float-left">\n' +
                '        <div class="card mb-4  main_card animated flipInX shadow">\n' +
                '          <div class="card-body p-3">\n' +
                '            <div class="row">\n' +
                '              <div id="LSpace_title" class="col-12">\n' +
                '                <div class="numbers clearfix">\n' +
                '                  <h1 class="display-4 font-weight-bolder text-center my-5">你还没有开通💕LoveSpace空间，找到你的另一半然后再联系刘小阳开通哦...</h1> ' +
                '                </div>\n' +
                '              </div>\n' +
                '            </div>\n' +
                '          </div>\n' +
                '        </div>\n' +
                '      </div>'
        }
    } else {
        console.log("有点错误")

    }
}




function searchCus1(L1){
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
        req1.onreadystatechange = searchCus1Complete;
        req1.send("type=search&method=byTel&tel="+ L1);
    }
}

function searchCus1Complete() {
    if (req1.readyState == 4 && req1.status == 200) {
        var json = JSON.parse(req1.responseText);//转换为json对象
        document.getElementById("L1").setAttribute("src",json[0].cus_img)

    }
}


function searchCus2(L2){
    var url = "../CustomerServlet";
    if (window.XMLHttpRequest)
        req2 = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req2 = new ActiveXObject("Microsoft.XMLHTTP");
    if (req2) {
        //采用POST方式，异步传输
        req2.open("post", url, true);
        //POST方式，必须加入如下头信息设定
        req2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req2.onreadystatechange = searchCus2Complete;
        req2.send("type=search&method=byTel&tel="+ L2);
    }
}

function searchCus2Complete() {
    if (req2.readyState == 4 && req2.status == 200) {
        var json = JSON.parse(req2.responseText);//转换为json对象
        document.getElementById("L2").setAttribute("src",json[0].cus_img)

    }
}
