package moba.controller.action;

//Action che si occupa di eliminare una recensione.

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import moba.model.dao.DAO;
import moba.model.dao.DaoRecensione;
import moba.model.dao.DaoValutazione;
import moba.model.dao.eccezioni.DAOException;
import moba.model.dao.enumeratori.Tabella;

public class EliminaRecensione extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		DaoRecensione dao;
		int idUtenteCancellazione = Integer.parseInt(request.getParameter("idUtente"));
		int idGiocoCancellazione = Integer.parseInt(request.getParameter("idGioco"));

		try {
			DaoValutazione daoValutazione = (DaoValutazione) DAO.getDaoInstance(Tabella.Valutazione);
			dao = (DaoRecensione) DAO.getDaoInstance(Tabella.Recensione);
			dao.delete(idUtenteCancellazione, idGiocoCancellazione);
			daoValutazione.delete(idUtenteCancellazione, idGiocoCancellazione);
			session.removeAttribute("recensioneInserita");
			return mapping.findForward("success");
		} catch (DAOException e) {
			request.setAttribute("errore", e.getMessage());
			return mapping.findForward("failure");
		}
	}
}
