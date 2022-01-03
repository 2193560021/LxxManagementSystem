function searchCountdown(){
    var url = "../LSpaceCountDownServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchCountdownComplete;
        req.send("type=search&LSpace_countdown_owners_id=" + document.getElementById("LSpace_countdown_owners_id").value);
    }
}

function searchCountdownComplete() {
    if (req.readyState === 4 && req.status === 200) {
        var json = JSON.parse(req.responseText);//转换为json对象
        var secArray = new Array(100);
        document.getElementById("LSpace_countdown").innerHTML = ""
        for(let i = 0;i < json.length;i++){

            secArray[i] = json[i].LSpace_countdown_time

            console.log("1-secArray[i]:" + secArray[i])


            document.getElementById("LSpace_countdown").innerHTML +=
                '<div class="card mb-4  main_card animated flipInX shadow" style="background: '+ json[i].LSpace_countdown_bg +'">\n' +
                '          <div class="card-body p-3">\n' +
                '            <div class="row">\n' +
                '              <div id="LSpace_days_2" class="col-12 text-light">\n' +
                '                <div class="numbers clearfix text-center">\n' +
                '                  <h2 class="font-weight-bolder my-3">'+ json[i].LSpace_countdown_title +'</h2>\n' +
                '                  <h1><span style="font-size: 100px" class="countDown_day">0</span>天</h1>\n' +
                '                  <h4>终于 <span>'+ json[i].LSpace_countdown_time +'</span></h4>\n' +
                '                </div>\n' +
                '              </div>\n' +
                '            </div>\n' +
                '          </div>\n' +
                '        </div>'



            let startTime = new Date(json[i].LSpace_countdown_time.toString()); // 开始时间
            let endTime = new Date(); // 结束时间

            let count_day = 0;
            secArray[i] = parseInt(Math.floor((startTime - endTime) / 1000));


            console.log("2-secArray[i]:" + secArray[i])

            window.setInterval(function(){
                var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
                if(secArray[i] > 0){
                    day = Math.floor(secArray[i] / (60 * 60 * 24));
                    hour = Math.floor(secArray[i] / (60 * 60)) - (day * 24);
                    minute = Math.floor(secArray[i] / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(secArray[i]) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }

                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;

                document.getElementsByClassName("countDown_day")[i].innerHTML = day
                secArray[i]--;
            }, 1000);

            console.log("2-count_day:" + count_day)

        }
        searchImgWall()
    }
}

function addCountdown(){
    var url = "../LSpaceCountDownServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = addCountdownComplete;
        req.send("type=add" +
            "&LSpace_countdown_owners_id=" +
            document.getElementById("LSpace_countdown_owners_id").value +
            "&LSpace_countdown_title=" +
            encodeURIComponent(document.getElementById("LSpace_countdown_title").value) +
            "&LSpace_countdown_time=" +
            encodeURIComponent(document.getElementById("LSpace_countdown_time").value) +
            "&LSpace_countdown_bg=" +
            document.getElementById("LSpace_countdown_bg").value


        );
    }
}

function addCountdownComplete(){

    if (req.readyState === 4 && req.status === 200) {
        searchCountdown()
    }
}