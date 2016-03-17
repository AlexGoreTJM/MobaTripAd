<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="/PAGES/jsp/customTag.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <div class="col-md-3">
				<p class="lead">Shop Name</p>
				<div class="list-group">
					<a href="#" class="list-group-item">Category 1</a> <a href="#"
						class="list-group-item">Category 2</a> <a href="#"
						class="list-group-item">Category 3</a>
				</div>
			</div> -->
			
			

        <div class="col-sm-12 col-md-3">
            <div class="panel-group" id="accordion">
            
            
            
            <!---------------------------------------------CATEGORIA---------------------------------------------------->
            
            
                <div class="panel panel-default" style="background: url('../img/background.jpg');">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            </span>Categoria</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body" style="background-color:black;">
                            <table class="table">
                            <c:forEach items="${listaCategoria}" var="categoria">
                                <tr>
                                    <td>
                                        <a href="/MobaTripAd/cercaCategoria.do?categoriaDaCercare=${categoria.idCategoria}">${categoria.nome}</a>
                                    </td>
                                </tr>
    						 </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                
            <!---------------------------------------------------PIATTAFORMA---------------------------------------------->
                
                
                <div class="panel panel-default" style="background: url('../img/background.jpg');">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            </span>Piattaforma</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                             <c:forEach items="${listaPiattaforma}" var="piattaforma">
                                <tr>
                                    <td>
                                        <a href="/MobaTripAd/cercaPiattaforma.do?piattaformaDaCercare=${piattaforma.idpiattaforma}">${piattaforma.nome}</a>
                                    </td>
                                </tr>
    						 </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                
            <!---------------------------------------------------AREA ADMIN---------------------------------------------->
			<c:if test="${utente.admin}">
                <div class="panel panel-default" style="background: url('../img/background.jpg');">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Admin</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="/MobaTripAd/inserisciGioco.do">Aggiungi Gioco/Recensione</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="/MobaTripAd/gestioneUtente.do">Gestisci Utenti</a> <!-- <span class="label label-info">5</span>  -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">Gestisci Recensioni</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">Gestisci Segnalazioni</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="/MobaTripAd/visualizzaStatistiche.do">Statistiche</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>    
            <!-----------------------------------------------------------------------------------------------

                <div class="panel panel-default" style="background: url('../img/background.jpg');">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-file">
                            </span>Reports</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-usd"></span><a href="http://www.jquery2dotnet.com">Sales</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-user"></span><a href="http://www.jquery2dotnet.com">Customers</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-tasks"></span><a href="http://www.jquery2dotnet.com">Products</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="glyphicon glyphicon-shopping-cart"></span><a href="http://www.jquery2dotnet.com">Shopping Cart</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>