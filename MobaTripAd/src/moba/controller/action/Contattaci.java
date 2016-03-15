package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class Contattaci extends Action {
	
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		
		DaoUtente dao;
		try {
			dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			
			return mapping.findForward("success");
			
		} catch (DAOException e) {

			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}

}