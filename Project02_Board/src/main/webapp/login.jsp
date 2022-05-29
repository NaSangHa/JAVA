<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
function form_check()
{	
    if($('#id').val().length == 0)
    {
        alert("아이디를 입력해주세요!");
        $('#id').focus();
        return;
    }

    if($('#pw').val().length == 0)
    {
        alert("비밀번호를 입력해주세요!");
        $('#pw').focus();
        return;
    }    
    submit_ajax();
}

function submit_ajax()
{
    var queryString = $('#login_frm').serialize();
    $.ajax({
        url: '/Project02_Board/LoginProcess',
        type: 'POST',
        data: queryString,
        dataType: 'text',
        success: function(json)
        {
            var result = JSON.parse(json);
        	
            if(result.code=="success")
            {
                alert(result.desc);
                window.location.replace("main.jsp");
            }
            else
            {
                alert(result.desc);
            }
        }
    });
}
</script> 

</head>
<body>	
    <div id="main_box">
        <form id="login_frm">
            아이디 : <input type="text" id="id" name="id" size="20" ><br/>
            비밀번호 : <input type="text" id="pw" name="pw" size="20" /><br/>
            <input type="button" value="로그인" id="button" onclick="form_check()"/> <br>
            <input type="button" value="회원가입" id="button" onclick="javascript:window.location='join.jsp'"/>
        </form>
    </div>
</body>
</html>