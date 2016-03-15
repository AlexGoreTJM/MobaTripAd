package moba.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoRecensione;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class EliminaRecensione extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		DaoRecensione dao;
		int idUtenteCancellazione = Integer.parseInt(request.getParameter("idUtente"));
		int idGiocoCancellazione = Integer.parseInt(request.getParameter("idGioco"));

		try {
			dao = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			dao.delete(idUtenteCancellazione, idGiocoCancellazione);
			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
	}
}
