package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoNews;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;

public class Autenticazione extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
	
	String tokenURL = request.getParameter("tokenURL");
	String token = (String)  request.getSession().getAttribute("token");
	if(tokenURL.equals(token)){
		
	    try {
	    	DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			Utente utente = (Utente) request.getSession().getAttribute("utente");
			dao.insert(utente);
			DaoNews dao2 = (DaoNews) DAO.getDaoInstance(Tabella.News);
			dao2.insert(utente.getEmail());
		} catch (DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	    
		return mapping.findForward("success");
	}	
	return mapping.findForward("error");
	}

}
