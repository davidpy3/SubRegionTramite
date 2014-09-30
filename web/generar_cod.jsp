
<%@page import="clases.generar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
		function codeSec1() {  
  
     // var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";  
      var chars = "0123456789"; 
      var string_length = 6;  
      var randomstring = '';  
  
      for (var i=0; i<string_length; i++) {  
              var rnum = Math.floor(Math.random() * chars.length);  
                    randomstring += chars.substring(rnum,rnum+1);  
              }  
       // document.forms["form"]["codeSec"].value = randomstring; 
     document.getElementById("codeSec").innerHTML =  randomstring
} 
	</script>
    </head>
    <body onload="codeSec1();">
      <form >
          <label>Codigo generado</label>
          <text style="color: #008cff"> <p id="codeSec"></p></text>
	</form>
	
    </body>
</html>
