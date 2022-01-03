function searchImgWall(){
    var url = "../LSpaceImgWallServlet"
    if (window.XMLHttpRequest)
        req = new XMLHttpRequest();
    else if (window.ActiveXObject)
        req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
        req.open("post", url, true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = searchImgWallComplete;
        req.send("type=search&LSpaceImgWall_owners_id=" + document.getElementById("LSpaceImgWall_owners_id").value);
    }
}

function searchImgWallComplete() {
    if (req.readyState === 4 && req.status === 200) {
        var json = JSON.parse(req.responseText);//转换为json对象
        var secArray = new Array(100);
        document.getElementById("LSpace_imgWall").innerHTML = ""
        for(let i = 0;i < json.length;i++){
            document.getElementById("LSpace_imgWall").innerHTML +=
                '<img src="'+ json[i].LSpace_imgWall_name +'" alt="" data-toggle="modal" data-target="#LSpaceImgShowModal" onclick="showLSpaceImg(\''+ json[i].LSpace_imgWall_title +'\','+ json[i]. LSpace_imgWall_id + ',\''+ json[i].LSpace_imgWall_name +'\',\''+ json[i].LSpace_imgWall_time +'\' )">'
        }
    }
}


function showLSpaceImg(imgWall_title,imgWall_id,imgWall_name,imgWall_time){
    document.getElementById("LSpaceImg_modal_body").setAttribute("src",imgWall_name)
    document.getElementById("title").innerHTML = imgWall_title
    document.getElementById("time").innerHTML  = imgWall_time
    document.getElementById("del_btn").setAttribute("onclick","del("+ imgWall_id +")")
}


function del(id){
    $("#delConfirm").click(function (){

        var url = "../LSpaceImgWallServlet";
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
    if (req.readyState === 4 && req.status === 200) {
        searchImgWall()
    }
}


function isPic()
{
    var pic=document.getElementById("LSpaceImg_wall_upload_form").LSpaceImgWall_image.value;
    $("#LSpaceImgWall_time").val(getCurrentDate())

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
