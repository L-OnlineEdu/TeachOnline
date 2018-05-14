String.prototype.temp = function(obj) {

    return this.replace(/\%\w+\.?\w+?\.?\w+?\%/gi,function(matchs) {


        var returns = obj[matchs.replace(/\%/g, "")]
        if (matchs.indexOf("\.")>0){
            matchs=matchs.replace(/\%/g, "")
            arr=matchs.split("\.")
            if(arr.length>2)
            {
                returns=obj[arr[0]][arr[1]][arr[2]]
            }else{
                returns=obj[arr[0]][arr[1]]
            }
        }
        return (returns + "") == "undefined"? "": returns
    })
}

String.prototype.answer = function() {
    var f=true;
    return this.replace(/[A-Z](\.|、)/gi,function(matchs) {

        if(f){
            var returns = matchs
            f=false;
        }else {
            var returns ="<br>"+matchs
        }

        return (returns + "") == "undefined"? "": returns
    })
}
function checkx(th,right) {
    nx=$(th).attr('name')
    $(th).attr("checked",true)
    if($(th).val().substr(-1)==right){
        //alert("对了")
        $("[name="+nx+"]").attr("disabled",true)
    }else {
        mapx={'A':1,'B':2,'C':3,'D':4}
        //$(this)
        abcd=$("#p"+$(th).attr("name")).html().split("<br>")
        abcd[mapx[$(th).val().substr(-1)]]="<font color='red'>"+abcd[mapx[$(th).val().substr(-1)]]+"</font>"
        abcd[mapx[right]]="<font color='green'>"+abcd[mapx[right]]+"</font>"

        $("#p"+$(th).attr("name")).html(abcd.join("<br>"))
        $("[name="+nx+"]").attr("disabled",true)
        //alert("错误")
    }

}
$(function () {

    findpaper()
})
arrx=[]
pushid='1'
function findpaper(){
    $.ajax({
        url:"/papers",
        data:"",
        success:function (data) {
            pushid=data.paperList[0].pid
            $.each(data.paperList,function (key,val) {
                console.info("pid:"+val.pid)
                arrx[key]=val.questions
                $("#sl").append("<option value='"+val.pid+"' id='k"+key+"' name='cop'>"+val.pname+"</option>")

            })

            $('select').material_select();
            jiexi()
        },
        error:function () {
            console.info("bad")
        }
    })

}
function jiexi() {
    // console.info(pushid)

    if ($("#sl :selected").attr("id")!=undefined){
        pushid=$("#sl :selected").val()
        k=$("#sl :selected").attr("id").substr(1);
    }

    else k=0

    ss=""
    $.each(arrx[k],function (keyx,valx) {
        var tx=$("#quest").val()
        valx.thx=(keyx+1)+"、"
        if (valx.flag==undefined){
            valx.answers=valx.answers.answer()
            valx.flag=true;
        }



        ss+= tx.temp(valx)

    })
    $("#quesbox").html(ss)
}
function sendx() {
    //window.location.href="about:blank";
    //window.close();
   // window.parent.close()
 //  window.parent.closeWin()
    //$("body").empty()
   // $("body").prepend($("#tp").html())
    $.ajax({
        url:"/pushpaper",
        data:{'paperid':pushid},
        success:function (data) {
            console.info(data.msg)
            if (data.msg=="success"){
                win.alert("提示","推送成功",function () {
                    window.parent.closeWin()
                })

            }
        }
    })
}