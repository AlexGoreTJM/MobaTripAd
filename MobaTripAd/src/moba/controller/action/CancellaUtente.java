package moba.controller.action;

//Action che permette all'admin di cancellare un utente.

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoUtente;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class CancellaUtente extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		DaoUtente dao;
		int idUtenteCancellazione = Integer.parseInt(request.getParameter("idUtenteCanc"));
		try {
			dao = (DaoUtente) DAO.getDaoInstance(Tabella.Utente);
			dao.delete(idUtenteCancellazione);
			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
	}
}
