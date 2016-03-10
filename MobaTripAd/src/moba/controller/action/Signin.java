package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.LoginForm;
import moba.controller.form.SigninForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Grado;
import moba.model.entity.Utente;

public class Signin extends Action{
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		
		SigninForm f = (SigninForm) form;
		
		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			
			
			Utente u = new Utente(f.getUsername(), f.getEmail(), f.getPassword(), f.getNome(), f.getCognome(), new Grado("Peone",1), f.getAvatar(), f.getInfo());
			dao.insert(u);
	        request.getSession().setAttribute("utente", u);
			
			return mapping.findForward("success");
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
		
	}
	
	

}
