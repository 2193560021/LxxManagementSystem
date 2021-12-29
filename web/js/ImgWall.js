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
    console.log(123)
    var url = "../ImgWallServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchAllComplete;
        req.send("type=search&method=searchByTel&imgWall_owner_tel=" + getCookie("tel"));
    }
}

function searchAllComplete(){
    if(req.readyState === 4 && req.status === 200){
        var json =  JSON.parse(req.responseText);//转换为json对象

        document.getElementById("ma5_gallery_main").innerHTML =
            '<figure class="float-left m-3">\n' +
            '                  <img src="../img/ImgWall_img/addImg.png" id="addImg"  data-toggle="modal" data-target="#ImgWallUploadModal" alt="">\n' +
            '                </figure>'

        if(json.length > 0){
            document.getElementById("imgWall_num").innerHTML = json.length
            for(let i=0; i < json.length; i++) {
                document.getElementById("ma5_gallery_main").innerHTML +=
                    '<figure class="gallery-item m-3"  data-toggle="modal" data-target="#ImgShowModal" onclick="showImg(\''+ json[i].imgWall_title +'\','+ json[i].imgWall_id + ',\''+ json[i].imgWall_name +'\',\''+ json[i].imgWall_time +'\' )">\n' +
                    '        <img src="../img/ImgWall_img/'+ json[i].imgWall_name +'" alt="">\n' +
                    '</figure>'
            }
        }
        else {
            document.getElementById("ma5_gallery_main").innerHTML +=
                "<p class='font-weight-bolder text-center mx-auto my-5' style='font-size: 35px'>一张照片都没有...快添加吧</p> "
        }
    }
}

function isPic()
{
    var pic=document.getElementById("img_wall_upload_form").imgWall_image.value;
    $("#imgWall_time").val(getCurrentDate())
    document.getElementById("imgWall_owner_tel").value =
        document.getElementById("tel").innerText

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

function showImg(imgWall_title,imgWall_id,imgWall_name,imgWall_time){
    document.getElementById("img_modal_body").setAttribute("src","../img/ImgWall_img/" + imgWall_name)
    document.getElementById("title").innerHTML = imgWall_title
    document.getElementById("time").innerHTML  = imgWall_time
    document.getElementById("del_btn").setAttribute("onclick","del("+ imgWall_id +")")
}

function del(id){
    $("#delConfirm").click(function (){

        var url = "../ImgWallServlet";
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