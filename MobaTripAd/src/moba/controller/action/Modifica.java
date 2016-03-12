package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.controller.form.ModificaForm;
import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;
import moba.model.entity.Utente;

public class Modifica extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		Utente u = (Utente) request.getAttribute("utente");
		ModificaForm f = (ModificaForm) form;
		
		
		try {
			DaoUtente dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			
			request.getSession().setAttribute("utente", dao.updateProfilo(u, f.getEmail(), f.getPassword(), f.getNome(), f.getCognome(), f.getInfo()));
			
			return mapping.findForward("success");
			
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}

	}
}
