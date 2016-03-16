<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>


	<%@ include file="../jsp/navigation.jsp" %>
	
	
	<div class="container">

        <div class="row">
        <%@ include file="../jsp/menu.jsp"%>
        
 
 
  <form role="form" action="contattaci.do" method="post" >
    <div class="col-md-8 col-sm-12">
    <h1>Contact Us</h1>
      
      <div class="form-group">
        <label for="InputName">Your Name</label>
        <div class="input-group">
          <input type="text" class="form-control" name="nome" id="InputName" placeholder="Enter Name" required>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputEmail">Your Email</label>
        <div class="input-group">
          <input type="email" class="form-control" id="InputEmail" name="email" placeholder="Enter Email" required  >
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputMessage">Message</label>
        <div class="input-group"
>
          <textarea name="messaggio" id="InputMessage" class="form-control" rows="5" required></textarea>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputReal">What is 4+3? (Simple Spam Checker)</label>
        <div class="input-group">
          <input type="text" class="form-control" name="valore" id="InputReal" required>
          <span class="input-group-addon"></span></div>
      </div>
      <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
    </div>
  </form>
  <hr class="featurette-divider hidden-lg">
  
</div>

</div>

	<script src="RESOURCES/js/jquery.js"></script>
	<script src="RESOURCES/js/notify.js"></script>
 <script src="RESOURCES/js/mobatripadScript.js"></script> 
	<!-- Bootstrap Core JavaScript -->
	<script src="RESOURCES/js/bootstrap.min.js"></script>
	</body>

</html>