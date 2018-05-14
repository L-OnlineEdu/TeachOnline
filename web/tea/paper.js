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

            danti=0
            tiku=0
            tiku=data.paperList.length
            $.each(data.paperList,function (key,val) {
                console.info("pid:"+val.pid)
                pid=val.pid
                arrx[pid]=val.questions
                danti+=val.questions.length

                $("#thaom").append(" <span id='p"+pid+"' onclick='jx(this)'>\n" +
                    "                <div style=\"display: flex; flex-direction: row; justify-content: space-between; align-items: center; height: 36px; margin-bottom: 5px; margin-top: 5px; cursor: pointer; position: relative; box-sizing: border-box; \"   >\n" +
                    "                    <i class=\"fa fa-caret-right\" style=\"position: absolute; left: 10px; top: 9px; color: rgb(102, 102, 102); display: block;\"></i>\n" +
                    "                    <div style=\"font-size: 12px; color: rgb(0, 0, 0); padding-left: 26px;\">\n" +
                    "                        <i class=\"mdi-content-inbox\" style=\"font-size: 21px; margin-right: 5px; vertical-align: middle; position: relative; top: -1px; left: -2px;\"></i>\n" +
                    "                        <span>"+val.pname+"</span>\n" +
                    "                    </div>\n" +
                    "                    <label style=\"text-align: right; font-size: 12px; color: rgb(74, 74, 74); margin-right: 30px;\">"+val.questions.length+"</label>\n" +
                    "                </div>\n" +
                    "            </span>")


                //$("#sl").append("<option value='"+val.pid+"' id='k"+key+"' name='cop'>"+val.pname+"</option>")

            })

            $('select').material_select();
            jiexi()
            $("#p0").children().addClass("selectx")
            $("#dtt").html(danti)
            $("#zjj").html(tiku)

        },
        error:function () {
            console.info("bad")
        }
    })

}
function jiexi() {
    // console.info(pushid)
    k=1;
    if ($(".selectx ").parent().attr("id")!=undefined){
        pushid=$(".selectx").parent().attr("id").substr(1)
        k=pushid
    }


    ss=""
    $.each(arrx[k],function (keyx,valx) {
        var tx=$("#questionx").html()
        valx.thx=(keyx+1)

        if (valx.flag==undefined){
            arr=[]
            al=['A','B','C','D']
            if (valx.answers.indexOf("A、")>-1){
                aa="、"
            }else {
                aa="."
            }

            for(i=0;i<al.length;i++){
                xstart=valx.answers.search(al[i]+"\.?、?")
                xend=-1
                if (i+1!=al.length)
                    xend=valx.answers.search(al[i+1]+"\.?、?")
                arr[i]=valx.answers.slice(xstart+2,xend)
                
            }
            valx.a00=arr[0]
            valx.a01=arr[1]
            valx.a02=arr[2]
            valx.a03=arr[3]
           
            valx.flag=true;
        }



        ss+= tx.temp(valx)

    })
    $("#qbox").html(ss)
}
function sendx() {
    //window.location.href="about:blank";
    //window.close();
   // window.parent.close()
 //  window.parent.closeWin()
    //$("body").empty()
   // $("body").prepend($("#tp").html())
    swal({
            title: "测验",
            text: "输入测验开启时间",
            type: "input",
            showCancelButton: false,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "单位为分钟"
        },
        function(inputValue){
            if (inputValue === false) return false;

            if (inputValue === "") {
                swal.showInputError("输入测验所需时间");
                return false
            }

            $.ajax({
                url:"/tea/pushpaper",
                data:{'paperid':pushid,'examTime':inputValue},
                success:function (data) {
                    console.info(data.msg)
                    if (data.msg=="success"){
                        swal("成功！", "测验已开启" ,"success");
                        window.location.href="/tea/paperPushed"

                    }else {
                        swal("失败！", "确认是否登录" ,"error");
                    }
                }
            })
        });




}
function jx(t) {

    $(t).children().addClass("selectx")
    $(t).siblings().children().removeClass("selectx")
    jiexi()
}