<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="signin.do" method="post">
<table>
    <tr>
      <td>Nome:</td>
      <td><input type="text" name="nome"></td>
    </tr>
    
    <tr>
      <td>Cognome:</td>
      <td><input type="text" name="cognome"></td>
    </tr>
    
    <tr>
      <td>Username:</td>
      <td><input type="text" name="username"></td>
    </tr>
    
    <tr>
      <td>Email:</td>
      <td><input type="text" name="email"></td>
    </tr>
    
    <tr>
      <td>Conferma email:</td>
      <td><input type="text" name="email_c"></td>
    </tr>
    
    <tr>
      <td>Password:</td>
      <td><input type="password" name="password"></td>
    </tr>
    
    <tr>
      <td>Conferma password:</td>
      <td><input type="password" name="password_c"></td>
    </tr>
    
    <tr>
      <td>Parlaci di te:</td>
      <td><input type="text" name="info"></td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" ></td>

</table>



</form>


</body>
</html>
