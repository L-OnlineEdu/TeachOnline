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
String.prototype.answer = function(obj) {

    return this.replace(/[A-Z](\.|、)/gi,function(matchs) {


        var returns = matchs
        return (returns + "") == "undefined"? "": returns
    })
}
function checkx(th,right) {
    var r=$(".qright")
    var w=$(".qwrong")
    rightnum=parseInt(r.html())
    wrongnum=parseInt(w.html())
    nx=$(th).attr('name')
    $(th).attr("checked",true)
    $("[name="+nx+"]").attr("disabled",true)
    console.info(nx.substr(2))
    if($(th).val().substr(-1)==right){

        $("#dtk"+nx.substr(2)).css("background","green")
        r.html(rightnum+1)
    }else {
        $("#dtk"+nx.substr(2)).css("background","red")
        $("#ans"+nx.substr(2)).show()
        w.html(wrongnum+1)
    }
    $("#dtk"+nx.substr(2)).children().css("color","white")

}
$(function () {
    findpaper()
})
function findpaper(){

    if (getTh()){
        th=getTh();

        $.ajax({
            url:"/displaypaper",
            data:{"paperid":th},
            success:function (data) {

                if (data.msg!="null"){
                    ss=""
                    sx=""
                    lex=0
                    //$.each(data.paperList,function (key,val) {
                        lex=data.questionList.length
                      //  console.info("pid:"+val.pid)
                        $.each(data.questionList,function (keyx,valx) {
                            var tx=$("#tb").val()
                            valx.keyx=keyx
                            valx.key1=keyx+1
                            aa=""
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
                                //console.info(al[i]+" st:"+xstart+" xe:"+xend)
                                //console.info(i+":"+arr[i])
                            }
                            //valx.a=arr
                            valx.a00=arr[0]
                            valx.a01=arr[1]
                            valx.a02=arr[2]
                            valx.a03=arr[3]

                            ss+= tx.temp(valx)
                            sx+=$("#dtkt").val().temp(valx)

                        })

                  //  })
                    $(".content_lit").html(lex)
                    $(".content_fs").html(lex)
                    $("#dtk").html(sx)
                    $("#tbbox").html(ss)
                }else{
                    console.info("试卷不存在")
                }

            },
            error:function () {
                console.info("bad")
            }
        })

    }
    else console.info("题号不存在")
}
function getTh() {
    th=$("#th").val();
    if (th!=""){
        return th;
    }else{
        return false;
    }
}